class AvailabilitiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_login
  before_action :logged_in_user, only: [:create, :index]
  before_action :correct_user,   only: [:destroy]

  def showUserAvailability
    @curr_user = User.find(session[:user_id])
    @userAvailabilitys = @curr_user.availabilitys.order('time ASC')
    render layout: 'web_application'
  end
  
  def index
    @curr_user = User.find(session[:user_id])
    @allAvailabilitys = Availability.order('time ASC').all
    render layout: 'web_application'
  end

  def new
    @curr_user = User.find(session[:user_id])
    render layout: 'web_application'
  end
 
  def create
    @availability = Availability.new(availability_params)
    if @availability.save
      flash.now[:info] = "Availability saved."
    else
      flash.now[:danger] = "Availability couldn't be saved."      
    end 
    render :new  
  end
 
  def destroy
    Availability.find(params[:id]).destroy
    flash.now[:success] = "Availability deleted"
    redirect_to showUserAvailability_path
  end

  def book
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def availability_params
      params.require(:availability).permit(
        :datetime
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
      @user = User.find(@availability.user_id)
      unless (current_user?(@user) || is_admin?)
        flash[:warning] = "You do not have authorization."        
        redirect_to dashboard_path 
      end
    end
end