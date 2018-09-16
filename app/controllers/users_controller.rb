class UsersController < ApplicationController
=begin 
GET     	/users	        index	    users_path          	page to list all users
GET     	/users/1	      show	    user_path(user)	      page to show user
GET	      /users/new	    new	      new_user_path	        page to make a new user (signup)
POST   	  /users	        create	  users_path	          create a new user
GET	      /users/1/edit	  edit	    edit_user_path(user)	page to edit user with id 1
PATCH	    /users/1	      update	  user_path(user)	      update user
DELETE	  /users/1	      destroy	  user_path(user)	      delete user
=end
  
  load_and_authorize_resource :except => :confirm_email
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_homepage
  before_action :logged_in_user, only: [:edit, :update, :index, :show, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @curr_user = User.find(session[:user_id])
    @users = User.where(activated: true)
    render layout: 'web_application'
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @curr_user = User.find(session[:user_id])
    @user = User.find(params[:id])
    redirect_to root_url unless @user.activated?
    render layout: 'web_application'
  end

  # GET /users/new
  def new
    @user = User.new
    render layout: "application_fluid"
  end

  # GET /users/1/edit
  def edit
=begin    
    user = User.find(params[:id])
    curr_user = User.find(session[:user_id])
    # If current user is editing their own info or is an admin
    if (user.id == curr_user.id) || curr_user.is_admin
      @user = user
    else
      flash.now[:warning] = "You don't have permission to edit another user."
      redirect_to dashboard_path
    end
=end
    @curr_user = User.find(session[:user_id])
    @user = User.find(params[:id])
    render layout: 'web_application'
  end

  # POST /users
  # POST /users.json
  def create
    secret_code = params[:secret_code]

    # LOL this is among the worst ways to do this don't judge -> prevents bots/strangers from signing up
    if secret_code != "xnb3gif3kt" && secret_code != "6wej5sfh8d"
      flash.now[:danger] = "Super secret code was invalid!"
      render :new
    else
      @user = User.new(user_params)
      
      # check for admin sign up
      if secret_code == "6wej5sfh8d"
        @user.is_admin = true
      end

      if @user.save
        @user.send_activation_email
        flash[:info] = "Please check your email to activate your account."
        redirect_to root_url
      else
        flash[:danger] = "Oops! Something went wrong. Please try signing up again or email us for help at info@codeology.club"
        render :new      
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @curr_user = User.find(session[:user_id])    
    #respond_to do |format|
    @user = User.find(params[:id])
    if @user.update_attributes(name: user_params[:name], email: user_params[:email])
      flash.now[:success] = "User info successfully updated"
      redirect_to @user
    else
      render 'edit', layout: 'web_application'
    end
    #end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    User.find(params[:id]).destroy
    flash.now[:success] = "User deleted"
    redirect_to users_url
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(
        :name, :email, :password, :password_confirmation #, :is_admin, :title, :bio, :is_officer
      )
    end

    # Redirect method
    def redirect_to_homepage
      flash[:warning] = "User doesn't exist."
      redirect_to root_path
    end

    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless user_is_logged_in?
        flash[:warning] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user OR (user is admin AND user being modified is not also admin)
    # Short circuiting allows admins to modify themselves
    def correct_user
      unless (current_user?(@user) || (is_admin? && !@user.is_admin?))
        flash[:warning] = "You do not have authorization."        
        redirect_to dashboard_path 
      end
    end
    
end
