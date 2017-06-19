module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end
  def user_is_logged_in?
    !!session[:user_id]
    end
end
