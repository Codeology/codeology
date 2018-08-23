class StaticPagesController < ApplicationController
  def home
    projlist = Projects.new
    array = projlist.choose(3)
    @projects = array
    render layout: 'application_fluid'
  end

  def about_us
    render layout: 'application_fluid'
  end

  def calendar
    render layout: 'application_fluid'  
  end

  def apply
    render layout: 'application_fluid'  
  end

  def recruitment
    render 'recruitment'
  end

  def projects
    projlist = Projects.new
    array = projlist.choose() # default parameter is all elements
    @projects = array
    render layout: 'application_fluid'
  end
end
