class UpcomingInterviewsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_login
  before_action :logged_in_user, only: [:index]
  before_action :correct_user,   only: [:destroy]
    
    def index
      @curr_user = User.find(session[:user_id])

      # Prune upcoming interviews
      upcomingInterviews = Upcoming_interview.where("time <= ?", 1.hours.from_now)
      upcomingInterviews.each do |upcoming|
          @past_interview = Past_interview.new(interviewee: upcoming.interviewee, interviewer: upcoming.interviewer, time: upcoming.time)
          @past_interview.save
          upcoming.destroy
      end

      # Get upcoming interviews
      allUpcomingReceiving = Upcoming_interview.where(interviewee: session[:user_id]).order('time ASC')
      allUpcomingGiving = Upcoming_interview.where(interviewer: session[:user_id]).order('time ASC')

      # Create map to store usernames
      @mappedUpcomingReceiving = []
      @mappedUpcomingGiving = []

      # Map usernames
      allUpcomingReceiving.each do |item|
        givingUser = User.find(item.interviewer)
        @mappedUpcomingReceiving.push({:username => givingUser.name, :interview => item})
      end
      
      # Map usernames
      allUpcomingGiving.each do |item|
        receivingUser = User.find(item.interviewee)
        @mappedUpcomingGiving.push({:username => receivingUser.name, :interview => item})
      end

      render layout: 'web_application'
    end
   
    def destroy
      Upcoming_interview.find(params[:id]).destroy
      flash.now[:success] = "Interview cancelled"
      redirect_to upcoming_interviews_path
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
        @interview = Upcoming_interview.find(params[:id])
        @giver = User.find(@interview.interviewer)
        @receiver = User.find(@interview.interviewee)
        unless (current_user?(@giver) || current_user?(@receiver) || is_admin?)
          flash[:warning] = "You do not have authorization."        
          redirect_to dashboard_path 
        end
      end
  end