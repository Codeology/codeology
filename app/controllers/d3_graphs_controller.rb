class D3GraphsController < ApplicationController
  def leadership_team
    data = {
     "img": "https://scontent-sjc2-1.xx.fbcdn.net/v/t31.0-8/19400415_206451389878660_1011893416748104183_o.jpg?oh=2acde66f9ed27fa5762122fe41e2b59f&oe=59EB07B0",
     "center_node": true,
     "children": [
        {
          "hero": "Albert",
          "name": "Alumni Relations",
          "img":  "https://scontent-sjc2-1.xx.fbcdn.net/v/t31.0-8/13653068_10154424213529596_6879623635421767397_o.jpg?oh=893e40d8e9b84eac1826bbb27da63c0e&oe=59FBB3CB",
          "size": 40000
        },
        {
          "hero": "Catherine Chang",
          "name": "President",
          "link": "http://marvel.com/characters/6/black_widow",
          "img":  "https://scontent-sjc2-1.xx.fbcdn.net/v/t31.0-8/13411980_10207169337287302_4585147783446341309_o.jpg?oh=f140ba85a0b2170c189784aca2f71b92&oe=5A2B7330",
          "size": 40000
        },
        {
          "hero": "Franklin Heng",
          "name": "Tech Chair",
          "link": "http://marvel.com/characters/11/daredevil",
          "img":  "https://scontent-sjc2-1.xx.fbcdn.net/v/t1.0-9/13934675_113642319085760_2356546706268305504_n.jpg?oh=569fa2aae3d6d6980643e6987fd8aef4&oe=59FD94ED",
          "size": 40000
        },
        {
          "hero": "Edward Qiu",
          "name": "Tech Chair",
          "link": "http://marvel.com/characters/66/wolverine",
          "img":  "https://scontent-sjc2-1.xx.fbcdn.net/v/t31.0-8/13723931_1152395468115653_8584107448179316296_o.jpg?oh=d46aa458ef71bc1af550e94d182b1e34&oe=59EC3482",
          "size": 40000
        },
        {
          "hero": "Tracy Chen",
          "name": "Curriculum Manager",
          "link": "http://marvel.com/characters/8/captain_america",
          "img":  "https://scontent-sjc2-1.xx.fbcdn.net/v/t31.0-8/16112743_10210637201277813_3829252424383579975_o.jpg?oh=efc479c791d9d2a396fc29e339789610&oe=5A2EDB68",
          "size": 40000
        },
        {
          "hero": "Timothy Hsu",
          "name": "Vice President",
          "link": "http://marvel.com/characters/29/iron_man",
          "img":  "https://scontent-sjc2-1.xx.fbcdn.net/v/t31.0-8/17546972_1613397875354443_1485770022978183082_o.jpg?oh=811de453e3e7384dde033b38085125a8&oe=59F92F38",
          "size": 40000
        },
        {
          "hero": "Nikita Gupta",
          "name": "Finance Chair",
          "link": "http://marvel.com/characters/60/thor",
          "img":  "https://scontent-sjc2-1.xx.fbcdn.net/v/t1.0-9/19601528_1521149234572008_1566928706303525499_n.jpg?oh=9dac3c105f220c613e85da197a8ffc7d&oe=59F78C4F",
          "size": 40000
        }
      ]
    }

    render :json => data
  end
end
