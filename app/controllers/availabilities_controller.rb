class AvailabilitiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_login
  before_action :logged_in_user, only: [:new, :create, :index]
  before_action :correct_user,   only: [:destroy]

  def showUserAvailability
    @curr_user = User.find(session[:user_id])
    @userAvailabilitys = @curr_user.availabilitys.order('time ASC')
    render layout: 'web_application'
  end

  def index
    # Prob not the most efficient way to do this
    # Every time a user looks at availabilities, all availabilities
    # within 24 hours are deleted (so that people can only sign up for
    # an interview at least 24 hours in advance)
    #
    # Potential optimization is to keep a boolean that tracks if this
    # has been done within the past hour interval. This will reduce amount
    # of times we hit the database.
    #
    # However, due to the small scale of this application this is fine
    # If for some reason this application needs to scale then the
    # optimization is recommended.
    #
    # NOTE: in production: use 7 hours ago as opposed to now since heroku servers are in PST
    # TODO: Create an environment variable for this so that we don't need to hardcode 24 or 17
    Availability.where("time <= ?", 7.hours.ago).destroy_all

    @curr_user = User.find(session[:user_id])
    @allAvailabilitys = Availability.where(["time > ?", 17.hours.from_now]).order('time ASC')

    #@allAvailabilitys = Availability.where.not(user_id: session[:user_id]).order('time ASC')
    render layout: 'web_application'
  end

  def new
    @curr_user = User.find(session[:user_id])
    render layout: 'web_application'
  end
 
  def create
    @curr_user = User.find(session[:user_id])
    # Check for existence of date and time. No need to check for language/location since these are booleans
    # and the lack of those parameters will result in failure later on in this method.
    if (params[:availability][:time].nil? || params[:availability][:date].nil?)
      flash[:danger] = "Availability not complete"
      redirect_to new_availability_path
      return      
    end

    # Get logistical details
    is_videocall =  (params[:availability][:is_videocall] == "true" ? true : false)
    is_python =  (params[:availability][:is_python] == "true" ? true : false)
    
    # Create dateTime object
    datetimeString = params[:availability][:date] + " " + params[:availability][:time]
    timeObj = Time.strptime(datetimeString, "%b %d, %Y %I:%M %P")
    timeObj = timeObj.utc

    # Create overlapping times
    ahead = timeObj + 60.minutes
    behind = timeObj - 60.minutes

    # create new availability item
    @availability = Availability.new(time: timeObj, user_id: session[:user_id], is_python: is_python, is_videocall: is_videocall)
    
    # Query DB for existing user availabilities to check again duplicates and overlapping times e.g. 8:30 and 9:00 overlap
    userAvailabilities = Availability.where(user_id: session[:user_id])
    
    # Finds if there is an existing availability at new availability timeslot
    dups = userAvailabilities.find {|avail| avail.time == timeObj}

    # Query DB for existing upcoming-interviews to check overlap/duplicates
    userUpcomings = Upcoming_interview.where(interviewer: session[:user_id]).or(Upcoming_interview.where(interviewee: session[:user_id]))
    
    # Finds if there is an upcoming interview at or overlapping with new availability timeslot
    overlapUpcoming = userUpcomings.find {|upcoming| upcoming.time > behind and upcoming.time < ahead}

    # If time is within 24 hours #NOTE: in production: use 17 hours from now as opposed to 24 since heroku servers are in PST
    if timeObj <= 17.hours.from_now.utc
      flash[:warning] = "Availability must be at least 24 hours ahead of current time"
    # if dups or overlap availability exists
    elsif dups
      flash[:warning] = "You already have an availability posted for that time"
    # if overlaps an existing upcoming interview
    elsif overlapUpcoming
      flash[:warning] = "You already have an overlapping upcoming interview for that time"
    # if model saving into database is successful
    elsif @availability.save
      flash[:success] = "Availability saved"
    else
      flash[:danger] = "Availability couldn't be saved"
    end
    
    redirect_to new_availability_path
  end
 
  def destroy
    Availability.find(params[:id]).destroy
    flash[:info] = "Availability deleted"
    redirect_to myAvailability_path
  end

  # the update path is used exclusively for booking interviews
  def update
    # Get user and requested availability
    @curr_user = User.find(session[:user_id])    
    @availability = Availability.find(params[:id])
    other_user = User.find(@availability.user_id)

    if @curr_user.id == other_user.id
      # This is for the case where someone submits an http request from outside the website
      flash[:warning] = "You can't book yourself"
      redirect_to availabilities_path
      return
    end

    # Create new upcoming interview instance
    @upcoming_interview = Upcoming_interview.new(interviewee: @curr_user.id, interviewer: @availability.user_id, 
                                                  time: @availability.time, is_python: @availability.is_python,
                                                  is_videocall: @availability.is_videocall)
    
    # Query DB for existing upcoming-interviews to check overlap/duplicates
    userUpcomings = Upcoming_interview.where(interviewer: session[:user_id]).or(Upcoming_interview.where(interviewee: session[:user_id]))
    
    # Create overlapping times
    timeObj = @availability.time.utc
    ahead = timeObj + 60.minutes
    behind = timeObj - 60.minutes
    
    # Finds if there is an upcoming interview at or overlapping with new availability timeslot
    overlapUpcoming = userUpcomings.find {|upcoming| upcoming.time > behind and upcoming.time < ahead}

    # if attempted booking overlaps upcoming interview exists
    if overlapUpcoming
      flash[:warning] = "You already have an overlapping upcoming interview for that time"
    # if model saving into database is successful    
    elsif @upcoming_interview.save
      flash[:success] = "Successful booking!"
      Availability.find(params[:id]).destroy
      # Query DB for overlapping availabilities and destroy
      # For example: if I book for 9pm, I want to delete my own availabilities at 8-10pm non-inclusive.
      Availability.where(["time < ? and time > ? and user_id = ?", ahead, behind, session[:user_id]]).destroy_all
      Availability.where(["time < ? and time > ? and user_id = ?", ahead, behind, other_user.id]).destroy_all
      @curr_user.send_booking_emails(other_user, @upcoming_interview)
    else
      flash[:danger] = "Booking failed. Submit an issue if this persists"
    end
    redirect_to availabilities_path
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def availability_params
      params.require(:availability).permit(
        :time
      )
    end

    def redirect_to_login
      redirect_to login_path
    end
      
    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless user_is_logged_in?
        flash[:warning] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user or user is admin
    def correct_user
      @availability = Availability.find(params[:id])
      @user = User.find(@availability.user_id)
      unless (current_user?(@user) || is_admin?)
        flash[:warning] = "You do not have authorization."        
        redirect_to dashboard_path 
      end
    end
end