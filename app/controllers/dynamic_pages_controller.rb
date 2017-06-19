class DynamicPagesController < ApplicationController
  def dashboard
    render 'dashboard'
  end

  def profile
    render 'profile'
  end
end
