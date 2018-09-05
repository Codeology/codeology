class StaticPagesController < ApplicationController
  def home
    projList = Projects.new
    projArray = projList.choose(3)
    @projects = projArray
    
    @leadership = People.leadership
    render layout: 'application_fluid'
  end

  def about_us
    @leadership = People.leadership
    @members = People.members
    @alumni = People.alumni
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
