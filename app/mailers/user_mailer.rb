class UserMailer < ActionMailer::Base
  default :from => "info@codeology.club"

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "[Codeology] Account Activation"
  end

  def password_reset
    @user = user
    mail to: user.email, subject: "[Codeology] Password Reset"
  end
end
