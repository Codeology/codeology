module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
    @current_user = nil
  end
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  def user_is_logged_in?
    !current_user.nil?
  end
end
