class WebappController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_login

    def dashboard
        @curr_user = User.find(session[:user_id])
        render layout: 'web_application'
    end
    
    private
        def redirect_to_login
            redirect_to login_path
        end
end