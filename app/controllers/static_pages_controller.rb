class StaticPagesController < ApplicationController
  def home
    projlist = Projects.new
    array = projlist.choose_three  
    @project_0_name = array[0][:name]
    @project_0_url = array[0][:imgurl]
    @project_0_blurb = array[0][:blurb]
    @project_1_name = array[1][:name]
    @project_1_url = array[1][:imgurl]
    @project_1_blurb = array[1][:blurb]
    @project_2_name = array[2][:name]
    @project_2_url = array[2][:imgurl]
    @project_2_blurb = array[2][:blurb]
    render layout: 'application_fluid'
  end

  def about_us
    render layout: 'application_fluid'
  end

  def projects
    render layout: 'application_fluid'
  end

  def calendar
    render layout: 'application_fluid'  
  end

  def recruitment
    render 'recruitment'
  end
end
