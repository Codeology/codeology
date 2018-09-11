class WebappController < ApplicationController

    def dashboard
        @current_user = User.find_by(id: session[:user_id])
        @username = current_user[:name]
        render layout: 'web_application'
    end
end