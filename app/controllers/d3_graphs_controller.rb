class D3GraphsController < ApplicationController
  def leadership_team

    children = User.all.map do |user|
      {
        "name": user.name,
        "title": user.title,
        "img": gravatar_url(user)
      }
    end


    data = {
     "img": "https://scontent-sjc2-1.xx.fbcdn.net/v/t31.0-8/19400415_206451389878660_1011893416748104183_o.jpg?oh=2acde66f9ed27fa5762122fe41e2b59f&oe=59EB07B0",
     "center_node": true,
     "children": children
    }

    render :json => data
  end
end
