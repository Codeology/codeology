class SessionsController < ApplicationController
  # GET	    /login	  login_path	  new	      page for a new session (login)
  # POST	  /login	  login_path	  create	  create a new session (login)
  # DELETE	/logout	  logout_path	  destroy	  delete a session (log out)
  
  def new
    render layout: 'application_fluid'  
  end

  # Allows existing users to log in, but new users must confirm
  # their emails via registration activation link
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.email_confirmed?
        log_in user
        flash[:success] = 'You are now logged in!'
        # TODO: redirect_or_back
        redirect_to root_path
      else
        flash[:info] = %Q[Please activate your account by following the instructions in the account confirmation email you received to proceed. Click #{view_context.link_to("here", new_user_email_confirmation_url)} to resend the confirmation email.]
        flash[:info] = flash[:info].html_safe
        render 'new'
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_path
  end
end
