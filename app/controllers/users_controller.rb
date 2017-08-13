class UsersController < ApplicationController
  load_and_authorize_resource :except => :confirm_email

  # GET /users
  # GET /users.json
  def index
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      flash[:success] = "Please check your email for the verification link to continue registration!"
      redirect_to root_url
    else
      flash[:error] = "Oops! Something went wrong. Please try signing up again or email us for help at info@codeology.club"
      render :new
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

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(
        :name, :email, :password, :password_confirmation, :is_admin, :title,
        :bio, :is_officer
      )
    end
end
