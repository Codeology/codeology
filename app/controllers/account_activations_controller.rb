class AccountActivationsController < ApplicationController
  
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      if user.expired?(:activation)
        flash[:warning] = "Activation Link Expired!"
        redirect_to root_url
      else
        user.activate
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
