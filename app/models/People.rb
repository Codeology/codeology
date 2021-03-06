class People
    # HARD CODED people names, titles, image urls, and linkedin URLs.
    # Eventually model will pull from DB as opposed to having data hardcoded

    @@leadership = [
        {:name => "Karthick Ravikumar", :title => "President", :imgurl => "people/karthick.jpg"},
        {:name => "Alma Pineda", :title => "Vice President", :imgurl => "people/alma.jpg"},
        {:name => "Ayush M.", :title => "Co-Director of Education", :imgurl => "people/ayush.jpg"},
        {:name => "Kyle Hua", :title => "Co-Director of Education", :imgurl => "people/kyle.jpg"},

        {:name => "Micah Harrison", :title => "Co-Director of Technology", :imgurl => "people/micah.jpg"},
        {:name => "Richard Huang", :title => "Co-Director of Technology", :imgurl => "people/richard.jpg"},
        {:name => "Jennifer Xiao", :title => "Co-Director of Member Relations", :imgurl => "people/jennifer.jpg"},
        {:name => "Roshan K.", :title => "Co-Director of Member Relations", :imgurl => "people/roshan.jpg"},

        {:name => "Tiffany Chung", :title => "Director of Media", :imgurl => "people/tiffany.jpg"},
        {:name => "Emily Wang", :title => "Director of Finance", :imgurl => "people/ewang.jpg"},
        {:name => "Kaavya Shah", :title => "Director of Industry", :imgurl => "people/kaavya.jpg"}
    ]

    @@members = [
        {:name => "Anna Young", :title => "Project Manager", :imgurl => "people/anna.jpg"},
        {:name => "Tina Zhao", :title => "Project Manager", :imgurl => "people/tina.jpg"},
        {:name => "Vaibhav Gattani", :title => "Project Manager", :imgurl => "people/vaib.jpg"},
        {:name => "Andrew Wang", :title => "Project Leader", :imgurl => "people/andrew.jpg"},

        {:name => "Anthony Zhou", :title => "Project Leader", :imgurl => "people/anthony.jpg"},
        {:name => "Bridget Cheng", :title => "Project Leader", :imgurl => "people/bridget.jpg"},
        {:name => "Calvin Chen", :title => "Project Leader", :imgurl => "people/calvin.jpg"},
        {:name => "Charlize Dang", :title => "Project Leader", :imgurl => "people/charlize.jpg"},

        {:name => "CJ Manna", :title => "Project Leader", :imgurl => "people/cj.jpg"},
        {:name => "Clark Wang", :title => "Project Leader", :imgurl => "people/clark.jpg"},
        {:name => "Jimmy Lee", :title => "Project Leader", :imgurl => "people/jimmy2.jpg"},
        {:name => "Matt Hashimoto", :title => "Project Leader", :imgurl => "people/matt.jpg"},

        {:name => "Michael Chen", :title => "Project Leader", :imgurl => "people/michael.jpg"},
        {:name => "Omar Flores", :title => "Project Leader", :imgurl => "people/omar.jpg"},
        {:name => "Susan Chen", :title => "Project Leader", :imgurl => "people/susan.jpg"},
        {:name => "Aarushi Karandikar", :title => "Active Member", :imgurl => "people/aarushi.jpg"},

        {:name => "Ada Hu", :title => "Active Member", :imgurl => "people/ada.jpg"},
        {:name => "Adithya Seshan", :title => "Active Member", :imgurl => "people/adi.jpg"},
        {:name => "Ahmed Baqai", :title => "Active Member", :imgurl => "people/ahmed.jpg"},
        {:name => "Alicia Matsumoto", :title => "Active Member", :imgurl => "people/ali.jpg"},

        {:name => "Amy Huang", :title => "Active Member", :imgurl => "people/amy.jpg"},
        {:name => "Angela Jiang", :title => "Active Member", :imgurl => "people/angelaj.jpg"},
        {:name => "Angela Xu", :title => "Active Member", :imgurl => "people/angelaxu.jpg"},
        {:name => "Ashley Chu", :title => "Active Member", :imgurl => "people/ashleychu.jpg"},

        {:name => "Cindy Zhang", :title => "Active Member", :imgurl => "people/cindy.jpg"},
        {:name => "Daniel Jae Im", :title => "Active Member", :imgurl => "people/default.jpg"},
        {:name => "Daniel Tseng", :title => "Active Member", :imgurl => "people/daniel.jpg"},
        {:name => "Dustin Luong", :title => "Active Member", :imgurl => "people/default.jpg"},

        {:name => "Emily Wang", :title => "Active Member", :imgurl => "people/emilyNew.jpg"},
        {:name => "Ethan Chen", :title => "Active Member", :imgurl => "people/ethan.jpg"},
        {:name => "Grace Altree", :title => "Active Member", :imgurl => "people/grace.jpg"},
        {:name => "Jasper Chen", :title => "Active Member", :imgurl => "people/jasper.jpg"},

        {:name => "Jen Buja", :title => "Active Member", :imgurl => "people/jen.jpg"},
        {:name => "John Um", :title => "Active Member", :imgurl => "people/john.JPG"},
        {:name => "Jun Hee Han", :title => "Active Member", :imgurl => "people/default.jpg"},
        {:name => "Kamille Fernando", :title => "Active Member", :imgurl => "people/kamille.jpg"},

        {:name => "Kyra Wong", :title => "Active Member", :imgurl => "people/default.jpg"},
        {:name => "Kevin Chai", :title => "Active Member", :imgurl => "people/kevinchai.jpg"},
        {:name => "Krishna Ravi", :title => "Active Member", :imgurl => "people/krishna.jpg"},
        {:name => "Kristie Lin", :title => "Active Member", :imgurl => "people/kristie.jpg"},

        {:name => "Mantej Panesar", :title => "Active Member", :imgurl => "people/mantej.jpg"},
        {:name => "Michelle Lin", :title => "Active Member", :imgurl => "people/michelle.jpg"},
        {:name => "Noah Alcus", :title => "Active Member", :imgurl => "people/noah.JPG"},
        {:name => "Pranav Pomalapally", :title => "Active Member", :imgurl => "people/default.jpg"},

        {:name => "Roger Zhang", :title => "Active Member", :imgurl => "people/roger.jpg"},
        {:name => "Saketh Kollu", :title => "Active Member", :imgurl => "people/saketh.jpg"},
        {:name => "Satiya Kem", :title => "Active Member", :imgurl => "people/satiya.jpg"},
        {:name => "Shaylan Dias", :title => "Active Member", :imgurl => "people/shaylan.jpg"},

        {:name => "SreeVidya Ganga", :title => "Active Member", :imgurl => "people/vidya.jpg"},
        {:name => "Srishti Goswamy", :title => "Active Member", :imgurl => "people/srishti.jpg"},
        {:name => "Taylor Yoo", :title => "Active Member", :imgurl => "people/taylor.jpg"},
        {:name => "Trevor Baba", :title => "Active Member", :imgurl => "people/trevor.jpg"},

        {:name => "Varun Murthy", :title => "Active Member", :imgurl => "people/varun.jpg"},
        {:name => "Vidhi Chander", :title => "Active Member", :imgurl => "people/default.jpg"},
        {:name => "Abinav Routhu", :title => "Contributing Member", :imgurl => "people/abinav.jpg"},
        {:name => "Christine Chao", :title => "Contributing Member", :imgurl => "people/christine.jpg"},

        {:name => "David Paner", :title => "Contributing Member", :imgurl => "people/david.jpg"},
        {:name => "Emily Hu", :title => "Contributing Member", :imgurl => "people/default.jpg"},
        {:name => "Eric Peng", :title => "Contributing Member", :imgurl => "people/eric.jpg"},
        {:name => "Haotian Ye", :title => "Contributing Member", :imgurl => "people/howie.jpg"},

        {:name => "Isha Mangal", :title => "Contributing Member", :imgurl => "people/isha.JPG"},
        {:name => "Jack Coyle", :title => "Contributing Member", :imgurl => "people/default.jpg"},
        {:name => "Jagpinder Singh", :title => "Contributing Member", :imgurl => "people/jag.jpg"},
        {:name => "Jessica Hsiao", :title => "Contributing Member", :imgurl => "people/jess.jpg"},

        {:name => "Jiayue Li", :title => "Contributing Member", :imgurl => "people/jaj.jpg"},
        {:name => "Jinsu Elhance", :title => "Contributing Member", :imgurl => "people/jinsu.jpg"},
        {:name => "Katherine Peng", :title => "Contributing Member", :imgurl => "people/katherine.jpg"},
        {:name => "Kevin Wang", :title => "Contributing Member", :imgurl => "people/kevin.jpg"},

        {:name => "Marvin Luong", :title => "Contributing Member", :imgurl => "people/marvin.jpg"},
        {:name => "Nitzan Orr", :title => "Contributing Member", :imgurl => "people/nitzan.jpg"},
        {:name => "Sera Yang", :title => "Contributing Member", :imgurl => "people/sera.jpg"},
        {:name => "Sherman Luo", :title => "Contributing Member", :imgurl => "people/sherman.JPG"},

        {:name => "Stella Lu", :title => "Contributing Member", :imgurl => "people/stella.jpg"},
        {:name => "Avocodeology", :title => "Club Mascot", :imgurl => "people/avocodeology.jpg"}

        # non-actives?

        # {:name => "Kevin Wang", :title => "Project Manager", :imgurl => "people/kevin.jpg"},
        # {:name => "Elizabeth Leong", :title => "Project Manager", :imgurl => "people/elizabeth.jpg"},
        # {:name => "Ashley Song", :title => "Project Leader", :imgurl => "people/ashley.jpg"},
        # {:name => "Jessica Hsiao", :title => "Senior Council", :imgurl => "people/jess.jpg"},
        # {:name => "Nikita Gupta", :title => "Senior Council", :imgurl => "people/nikita.jpg"},
        # {:name => "Asli Akalin", :title => "Active Member", :imgurl => "people/asli.png"},
        # {:name => "Dorothy Xu", :title => "Active Member", :imgurl => "people/dorothy.jpg"},
        # {:name => "Sai Kapuluru", :title => "Active Member", :imgurl => "people/sai.jpg"},
        # {:name => "Snehpreet Kaur", :title => "Active Member", :imgurl => "people/sneh.jpg"},

    ]

    @@alumni = [
        {:name => "Catherine Chang", :title => "Atlassian", :imgurl => "alumni/catherine.jpg"},
        {:name => "Albert Hu", :title => "Samsara", :imgurl => "alumni/albert.jpg"},
        {:name => "Tracy Chen", :title => "Amazon", :imgurl => "alumni/tracy.jpg"},
        {:name => "Tim Hsu", :title => "Citrix", :imgurl => "alumni/tim.jpg"},
        {:name => "David Gao", :title => "Splunk", :imgurl => "alumni/david.jpg"},
        {:name => "Marcus Lee", :title => "Amazon", :imgurl => "alumni/marcus.jpg"}
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
