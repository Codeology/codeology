class WebappController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_login

  # You can prob merge this controller wih availability controller
  # Since only page this one has is dashboard
  def dashboard
    @curr_user = User.find(session[:user_id])
    @totalAvail = Availability.count
    @yourAvail = Availability.where(user_id: session[:user_id]).count
    @received = Past_interview.where(interviewee: session[:user_id]).count
    @given = Past_interview.where(interviewer: session[:user_id]).count
    @upcomingReceive = Upcoming_interview.where(interviewee: session[:user_id]).count
    @upcomingGive = Upcoming_interview.where(interviewer: session[:user_id]).count

    render layout: 'web_application'
  end
  
  private
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
      unless (current_user?(@user) || is_admin?)
        flash[:warning] = "You do not have authorization."        
        redirect_to dashboard_path 
      end
    end
end