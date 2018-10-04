class UserMailer < ActionMailer::Base
  default :from => "info@codeology.club"

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "[Codeology] Account Activation"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "[Codeology] Password Reset"
  end

  def new_booking(user, other_user, upcoming_interview)
    @user = user
    @other_user = other_user
    @upcoming_interview = upcoming_interview
    mail to: user.email, subject: "[Codeology] New Interview"
  end

  def cancel_booking(user, other_user, upcoming_interview)
    @user = user
    @other_user = other_user
    @upcoming_interview = upcoming_interview
    mail to: user.email, subject: "[Codeology] Cancelled Interview"
  end
end
