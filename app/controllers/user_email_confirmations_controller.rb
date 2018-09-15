class UserEmailConfirmationsController < ApplicationController
  def new
    flash.clear
    @user = User.new
  end

  def create
    @user = User.where(email: params[:user][:email]).first

    if @user
      params[:id] = @user.confirm_token
      UserMailer.account_activation(@user).deliver
      flash[:success] = "Please check your email for the verification link to continue registration!"
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
