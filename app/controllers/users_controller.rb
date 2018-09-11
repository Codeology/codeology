class UsersController < ApplicationController
  load_and_authorize_resource :except => :confirm_email
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_homepage

  # GET /users
  # GET /users.json
  def index
    @username = User.find_by(id: session[:user_id])[:name]
    render layout: 'web_application'
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    render layout: 'web_application'
  end

  # GET /users/new
  def new
    @user = User.new
    render layout: "application_fluid"
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    secret_code = params[:secret_code]

    # LOL this is probably among the worst ways to do this don't judge -> prevents bots/strangers from signing up
    if secret_code != "xnb3gif3k"
      flash.now[:danger] = "Super secret code was invalid!"
      render :new
    else
      @user = User.new(user_params)
      if @user.save
        #UserMailer.registration_confirmation(@user).deliver
        # flash[:success] = "Please check your email for the verification link to continue registration!"
        #redirect_to root_url
        log_in @user
        redirect_to @user
      else
        # flash[:danger] = "Oops! Something went wrong. Please try signing up again or email us for help at info@codeology.club"
        render :new      
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /users/1/confirm_email
  def confirm_email
      user = User.find_by_confirm_token(params[:id])
      if user
        user.activate_email
        flash[:success] = "Welcome to Codeology! Your email has been confirmed. Please sign in to continue."
        redirect_to login_path
      else
        flash[:error] = "Sorry. User does not exist"
        redirect_to root_url
      end
  end

  # GET /userNotFound
  def userNotFound
    render layout: "application_fluid"
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(
        :name, :email, :password, :password_confirmation #, :is_admin, :title, :bio, :is_officer
      )
    end
    
    def redirect_to_homepage
      redirect_to root_path
    end
end
