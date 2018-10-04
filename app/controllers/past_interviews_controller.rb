class PastInterviewsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_login
  before_action :logged_in_user, only: [:index]
  before_action :correct_user,   only: [:edit, :show, :update]
    
  def index
    @curr_user = User.find(session[:user_id])

    # Get upcoming interviews
    allPastReceiving = Past_interview.where(interviewee: session[:user_id]).order('time ASC')
    allPastGiving = Past_interview.where(interviewer: session[:user_id]).order('time ASC')

    # Create map to store usernames
    @mappedPastReceiving = []
    @mappedPastGiving = []

    # Map received interviews to giving usernames
    allPastReceiving.each do |item|
      givingUser = User.find(item.interviewer)
      @mappedPastReceiving.push({:username => givingUser.name, :interview => item})
    end
    
    # Map given interviews to receiving usernames
    allPastGiving.each do |item|
      receivingUser = User.find(item.interviewee)
      @mappedPastGiving.push({:username => receivingUser.name, :interview => item})
    end

    render layout: 'web_application'
  end

  def show
    @curr_user = User.find(session[:user_id])
    @past_interview = Past_interview.find(params[:id])
    # Find other user's id and then find that user
    @other_user, @is_interviewee = get_other_user_and_is_interviewee(@curr_user, @past_interview)
    render layout: 'web_application'
  end

  def edit
    @curr_user = User.find(session[:user_id])
    @past_interview = Past_interview.find(params[:id])
    # Find if user is interviewer or interviewee
    @other_user, @is_interviewee = get_other_user_and_is_interviewee(@curr_user, @past_interview)
    render layout: 'web_application'
  end

  def update
    @curr_user = User.find(session[:user_id])
    @past_interview = Past_interview.find(params[:id])
    @other_user, @is_interviewee = get_other_user_and_is_interviewee(@curr_user, @past_interview)

    if @is_interviewee
      if @past_interview.update_attributes(excitement_score: params[:excitement], 
                                            question_score: params[:question],
                                            helpfulness_score: params[:helpfulness],
                                            feedback_interviewer: params[:feedback_interviewer])
        flash[:success] = "Feedback updated!"
      else
        flash[:danger] = "Feedback update failed"
      end
    else
      if @past_interview.update_attributes(technical_score: params[:technical], 
                                            problem_solving_score: params[:problem_solving],
                                            communication_score: params[:communication],
                                            feedback_interviewee: params[:feedback_interviewee])
        flash[:success] = "Feedback updated!"
      else
        flash[:danger] = "Feedback update failed"
      end
    end
    redirect_to past_interview_path(@past_interview)
  end

  private

    def redirect_to_login
      redirect_to login_path
    end
      
    def get_other_user_and_is_interviewee(curr_user, past_interview)
      if past_interview.interviewee == curr_user.id
        other_id = past_interview.interviewer
        is_interviewee = true
      else
        other_id = @past_interview.interviewee
        is_interviewee = false
      end
      other_user = User.find(other_id)
      return other_user, is_interviewee
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
      @interview = Past_interview.find(params[:id])
      @giver = User.find(@interview.interviewer)
      @receiver = User.find(@interview.interviewee)
      unless (current_user?(@giver) || current_user?(@receiver) || is_admin?)
        flash[:warning] = "You do not have authorization."        
        redirect_to dashboard_path 
      end
    end
end