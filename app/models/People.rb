class People
    # HARD CODED people names, titles, image urls, and linkedin URLs.
    # Eventually model will pull from DB as opposed to having data hardcoded

    @@leadership = [
        {:name => "Lyric Yu", :title => "President", :imgurl => "people/lyric.jpg"},
        {:name => "Calvin Chen", :title => "Vice President", :imgurl => "people/calvin.jpg"},
        {:name => "Karthick Ravikumar", :title => "Director of Education", :imgurl => "people/karthick.jpg"},
        {:name => "Micah Harrison", :title => "Co-Director of Technology", :imgurl => "people/micah.jpg"},
        {:name => "Richard Huang", :title => "Co-Director of Technology", :imgurl => "people/richard.jpg"},
        {:name => "Alma Pineda", :title => "Co-Director of Member Relations", :imgurl => "people/alma.jpg"},
        {:name => "Jennifer Xiao", :title => "Co-Director of Member Relations", :imgurl => "people/jennifer.jpg"},
        {:name => "Tiffany Chung", :title => "Director of Media", :imgurl => "people/tiffany.jpg"},
        {:name => "Emily Wang", :title => "Director of Finance", :imgurl => "people/ewang.jpg"},
        {:name => "Kaavya Shah", :title => "Director of Industry", :imgurl => "people/kaavya.jpg"}
    ]

    @@members = [
        {:name => "Jiayue Li", :title => "Project Manager", :imgurl => "people/jaj.jpg"},
        {:name => "Kevin Wang", :title => "Project Manager", :imgurl => "people/kevin.jpg"},
        {:name => "Tina Zhao", :title => "Project Manager", :imgurl => "people/tina.jpg"},
        {:name => "Elizabeth Leong", :title => "Project Manager", :imgurl => "people/elizabeth.jpg"},
        {:name => "Jimmy Lee", :title => "Project Leader", :imgurl => "people/jimmy.jpg"},

        {:name => "Katherine Peng", :title => "Project Leader", :imgurl => "people/katherine.jpg"},
        {:name => "Anna Young", :title => "Project Leader", :imgurl => "people/anna.jpg"},
        {:name => "Haotian Ye", :title => "Project Leader", :imgurl => "people/haotian.jpg"},
        {:name => "Ashley Song", :title => "Project Leader", :imgurl => "people/ashley.jpg"},
        {:name => "Bridget Cheng", :title => "Project Leader", :imgurl => "people/bridget.jpg"},

        {:name => "Marvin Luong", :title => "Project Leader", :imgurl => "people/marvin.jpg"},
        {:name => "Kyle Hua", :title => "Project Leader", :imgurl => "people/kyle.jpg"},
        {:name => "Vaibhav Gattani", :title => "Project Leader", :imgurl => "people/vaib.jpg"},
        {:name => "Ayush Maganahalli", :title => "Project Leader", :imgurl => "people/ayush.png"},
        {:name => "Andrew Wang", :title => "General Member", :imgurl => "people/andrew.jpg"},

        {:name => "Asli Akalin", :title => "General Member", :imgurl => "people/asli.png"},
        {:name => "Charlize Dang", :title => "General Member", :imgurl => "people/charlize.jpg"},
        {:name => "Christine Chao", :title => "General Member", :imgurl => "people/default.jpg"},
        {:name => "Clark Wang", :title => "General Member", :imgurl => "people/default.jpg"},
        {:name => "David Paner", :title => "General Member", :imgurl => "people/david.jpg"},

        {:name => "Dorothy Xu", :title => "General Member", :imgurl => "people/dorothy.jpg"},
        {:name => "Abinav Routhu", :title => "General Member", :imgurl => "people/abinav.jpg"},
        {:name => "Emily Wang", :title => "General Member", :imgurl => "people/emilyNew.jpg"},
        {:name => "Eric Peng", :title => "General Member", :imgurl => "people/eric.jpg"},
        {:name => "Jagpinder Singh", :title => "General Member", :imgurl => "people/jag.jpg"},

        {:name => "Matt Hashimoto", :title => "General Member", :imgurl => "people/matt.jpg"},
        {:name => "Michael Chen", :title => "General Member", :imgurl => "people/michael.jpg"},
        {:name => "Sai Kapuluru", :title => "General Member", :imgurl => "people/sai.jpg"},
        {:name => "Snehpreet Kaur", :title => "General Member", :imgurl => "people/sneh.jpg"},
        {:name => "Stella Lu", :title => "General Member", :imgurl => "people/stella.png"},

        {:name => "Susan Chen", :title => "General Member", :imgurl => "people/susan.jpg"},
        {:name => "Varun Murthy", :title => "General Member", :imgurl => "people/varun.jpg"}

    ]

    @@alumni = [
        {:name => "Catherine Chang", :title => "Atlassian", :imgurl => "alumni/catherine.jpg"},
        {:name => "Albert Hu", :title => "Samsara", :imgurl => "alumni/albert.jpg"},
        {:name => "Tracy Chen", :title => "Amazon", :imgurl => "alumni/tracy.jpg"},
        {:name => "Tim Hsu", :title => "Citrix", :imgurl => "alumni/tim.jpg"},
        {:name => "David Gao", :title => "SAP Ariba", :imgurl => "alumni/david.jpg"},
        {:name => "Marcus Lee", :title => "Amazon", :imgurl => "alumni/marcus.jpg"},
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
