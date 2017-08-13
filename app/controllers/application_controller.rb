class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include ApplicationHelper

  rescue_from CanCan::AccessDenied do |exception|
    redirect_path = current_user.nil? ? login_path : root_path
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to redirect_path, :alert => exception.message }
    end
  end
end
