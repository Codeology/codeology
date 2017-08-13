class UserMailer < ActionMailer::Base
    default :from => "info@codeology.club"

   def registration_confirmation(user)
      @user = user
      mail(:to => "#{user.name} <#{user.email}>", :subject => "[Codeology] Registration Confirmation")
   end
 end
