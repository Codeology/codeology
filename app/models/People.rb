class People
    # HARD CODED people names, titles, image urls, and linkedin URLs.
    # Eventually model will pull from DB as opposed to having data hardcoded

    @@leadership = [
        {:name => "Sera Yang", :title => "President", :imgurl => "people/sera.jpg"},
        {:name => "Jinsu Elhance", :title => "Vice-President", :imgurl => "people/jinsu.jpg"},
        {:name => "Sherman Luo", :title => "Director of Education", :imgurl => "people/sherman.jpg"},
        {:name => "Jiayue Li", :title => "Director of Technology", :imgurl => "people/jaj.jpg"},
        {:name => "Amanda Te", :title => "Co-Director of Social", :imgurl => "people/amanda.jpg"},
        {:name => "Calvin Chen", :title => "Co-Director of Social", :imgurl => "people/calvin.jpg"},
        {:name => "Jessica Hsiao", :title => "Director of Media", :imgurl => "people/jess.jpg"},
        {:name => "Lyric Yu", :title => "Director of Industry", :imgurl => "people/lyric.jpg"}
    ]

    @@members = [
        {:name => "Andrew Liu", :title => "Project Manager", :imgurl => "people/andrew.jpg"},
        {:name => "Carson Trinh", :title => "Project Manager", :imgurl => "people/carson.jpg"},
        {:name => "Claire Li", :title => "Project Leader", :imgurl => "people/claire.jpg"},
        {:name => "Kevin Wang", :title => "Project Leader", :imgurl => "people/kevin.jpg"},
        {:name => "Micah Harrison", :title => "Project Leader", :imgurl => "people/micah.jpg"},
        {:name => "Myles Domingo", :title => "Designer", :imgurl => "people/myles.jpg"},
        {:name => "Nikita Gupta", :title => "General Member", :imgurl => "people/nikita.jpg"},
        {:name => "Shalandy Zhang", :title => "Project Leader", :imgurl => "people/shalandy.jpg"},
        {:name => "Tina Zhao", :title => "Project Leader", :imgurl => "people/tina.jpg"},
        {:name => "Weiwei Zhang", :title => "Industry Coordinator", :imgurl => "people/weiwei.jpg"}
    ]

    @@alumni = [
        #{:name => "Tracy Chen", :title => "Amazon", :imgurl => "alumni/tracy.jpg"}
    ]

    def self.leadership
        @@leadership
    end

    def self.members
        @@members
    end

    def self.alumni
        @@alumni
    end

end
