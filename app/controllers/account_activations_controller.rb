class AccountActivationsController < ApplicationController
  
  def new
    render layout: 'application'
  end

  def create
    @user = User.find_by(email: params[:account_activations][:email].downcase)
    if @user
      if @user.activated?
        flash[:info] = "Email already activated"
        redirect_to root_url
      else
        @user.send(:reset_activation_digest)
        @user.send_activation_email
        flash[:info] = "Email sent with account activation instructions"
        redirect_to root_url
      end
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      if user.expired?(:activation)
        flash[:warning] = "Activation Link Expired!"
        redirect_to new_account_activation_path
      else
        user.activate
        user.update_attribute(:activation_digest, nil)
        flash[:success] = "Account activated! Please log in to continue."
        redirect_to root_url
      end
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end

  private

end
