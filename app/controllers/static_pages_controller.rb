class StaticPagesController < ApplicationController
  def home
    render layout: 'application_fluid'
  end

  def team
    render 'team'
  end

  def recruitment
    render 'recruitment'
  end

  def franklin
    render 'franklin'
  end

  def edward
    render 'edward'
  end

end
