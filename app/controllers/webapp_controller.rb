class WebappController < ApplicationController
    def dashboard
        render layout: 'web_application'
    end
end