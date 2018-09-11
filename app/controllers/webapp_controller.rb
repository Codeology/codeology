class WebappController < ApplicationController
    include SessionsHelper

    def dashboard
        @username = current_user.name
        render layout: 'web_application'
    end
end