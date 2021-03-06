class SessionsController < ApplicationController
  # GET	    /login	  login_path	  new	      page for a new session (login)
  # POST	  /login	  login_path	  create	  create a new session (login)
  # DELETE	/logout	  logout_path	  destroy	  delete a session (log out)
  include SessionsHelper

  def new
    # TODO write test case: if user is already logged in, then login redirects to dashboard
    if user_is_logged_in?
      redirect_to dashboard_path
    else
      render layout: 'application'  
    end
  end

  # Allows existing users to log in, but new users must confirm
  # their emails via registration activation link
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        flash.now[:success] = 'You are now logged in!'
        redirect_to dashboard_path
      else
        flash[:info] = 'Please activate your account by following the instructions in the account confirmation email you received to proceed.'
       # flash[:info] = flash[:info].html_safe
        render 'new'
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to :root
  end
end
