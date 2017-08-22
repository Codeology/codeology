class D3GraphsController < ApplicationController
  def leadership_team

    children = User.leadership_team.map do |user|
      {
        "name": user.name,
        "title": user.title,
        "img": gravatar_url(user)
      }
    end


    data = {
      "img": view_context.asset_url("codeology_logo.png"),
      "center_node": true,
      "children": children
    }

    render :json => data
  end
end
