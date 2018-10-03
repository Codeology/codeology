class AvailabilitiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_login
  before_action :logged_in_user, only: [:new, :create, :index]
  before_action :correct_user,   only: [:destroy]

  def showUserAvailability
    @curr_user = User.find(session[:user_id])
    @userAvailabilitys = @curr_user.availabilitys.order('time ASC')
    render layout: 'web_application'
  end
  
  def prune
    @curr_user = User.find(session[:user_id])
    Availability.where("time <= ?", 24.hours.from_now).destroy_all
    redirect_to availabilities_path
  end

  def index
    
    # Not the most efficient way to do this
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
    Availability.where("time <= ?", 24.hours.from_now).destroy_all

    @curr_user = User.find(session[:user_id])
    @allAvailabilitys = Availability.where.not(user_id: session[:user_id]).order('time ASC')
    render layout: 'web_application'
  end

  def new
    @curr_user = User.find(session[:user_id])
    render layout: 'web_application'
  end
 
  def create
    @curr_user = User.find(session[:user_id])
    datetimeString = params[:availability][:date] + " " + params[:availability][:time]
    timeObj = Time.strptime(datetimeString, "%m/%d/%Y %l:%M %P")
    timeObj = timeObj.gmtime

    # Create overlapping times
    ahead = timeObj + 30.minutes
    behind = timeObj - 30.minutes

    # create new availability item
    @availability = Availability.new(time: timeObj, user_id: session[:user_id])
    
    # Query DB for existing user availabilities to check again duplicates and overlapping times e.g. 8:30 and 9:00 overlap
    userAvailabilities = Availability.where(user_id: session[:user_id])
  
    # Finds if there is an availability at or overlapping with new availability timeslot
    dups = userAvailabilities.find {|avail| avail.time == timeObj}
    overlapAhead = userAvailabilities.find {|avail| avail.time == ahead}
    overlapBehind = userAvailabilities.find {|avail| avail.time == behind}

    # Query DB for existing upcoming-interviews to check overlap/duplicates
    userUpcomings = Upcoming_interview.where(interviewer: session[:user_id]).or(Upcoming_interview.where(interviewee: session[:user_id]))
    
    # Finds if there is an upcoming interview at or overlapping with new availability timeslot
    dupsUpcoming = userUpcomings.find {|upcoming| upcoming.time == timeObj}
    overlapAheadUpcoming = userUpcomings.find {|upcoming| upcoming.time == ahead}
    overlapBehindUpcoming = userUpcomings.find {|upcoming| upcoming.time == behind}

    # If time is within 24 hours
    if timeObj <= 24.hours.from_now
      flash[:warning] = "Availability must be at least 24 hours ahead of current time"
    # if dups or overlap availability exists
    elsif dups
      flash[:warning] = "You already have an availability posted for that time"
    elsif overlapAhead || overlapBehind
      flash[:warning] = "You already have an overlapping availability posted for that time"
    # if dups or overlap upcoming interview exists
    elsif dupsUpcoming
      flash[:warning] = "You already have an upcoming interview for that time"
    elsif overlapAheadUpcoming || overlapBehindUpcoming
      flash[:warning] = "You already have an overlapping upcoming interview for that time"
    # if model saving into database is successful
    elsif @availability.save
      flash[:success] = "Availability saved"
    else
      flash[:danger] = "Availability couldn't be saved"
    end
    # puts @availability.errors.full_messages
    
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
    # Create new upcoming interview instance
    @upcoming_interview = Upcoming_interview.new(interviewee: @curr_user.id, interviewer: @availability.user_id, time: @availability.time)
    
    # Query DB for existing upcoming-interviews to check overlap/duplicates
    userUpcomings = Upcoming_interview.where(interviewer: session[:user_id]).or(Upcoming_interview.where(interviewee: session[:user_id]))
    
    # Create overlapping times
    timeObj = @availability.time.gmtime
    ahead = timeObj + 30.minutes
    behind = timeObj - 30.minutes
    
    # Finds if there is an upcoming interview at or overlapping with new availability timeslot
    dupsUpcoming = userUpcomings.find {|upcoming| upcoming.time == timeObj}
    overlapAheadUpcoming = userUpcomings.find {|upcoming| upcoming.time == ahead}
    overlapBehindUpcoming = userUpcomings.find {|upcoming| upcoming.time == behind}
   
    # if dups or overlap upcoming interview exists
    if dupsUpcoming
      flash[:warning] = "You already have an upcoming interview for that time"
    elsif overlapAheadUpcoming || overlapBehindUpcoming
      flash[:warning] = "You already have an overlapping upcoming interview for that time"
    # if model saving into database is successful    
    elsif @upcoming_interview.save
      flash[:success] = "Successful booking!"
      Availability.find(params[:id]).destroy
      # Query DB for overlapping availabilities and destroy
      # For example: if I book for 9pm, I want to delete my own availabilities at 8:30, 9:00, and/or 9:30 due to overlap with my new booking.
      Availability.where(time: ahead).or(Availability.where(time: behind).or(Availability.where(time: timeObj))).where(user_id: session[:user_id]).destroy_all
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