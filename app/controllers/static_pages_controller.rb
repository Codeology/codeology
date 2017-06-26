class StaticPagesController < ApplicationController
  def home
    render 'home'
  end

  def help
    render 'help'
  end

  def about
    render 'about'
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
