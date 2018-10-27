class StaticPagesController < ApplicationController
  def home
    projList = Projects.new
    projArray = projList.choose(3)
    @projects = projArray
    
    @leadership = People.leadership
    render layout: 'application'
  end

  def about
    @leadership = People.leadership
    @members = People.members
    @alumni = People.alumni
    render layout: 'application'
  end

  def calendar
    render layout: 'application'
  end

  def apply
    render layout: 'application'  
  end

  def projects
    projlist = Projects.new
    array = projlist.choose() # default parameter is all elements
    @projects = array
    render layout: 'application'
  end
end
