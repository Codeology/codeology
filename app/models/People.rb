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
        {:name => "Weiwei Zhang", :title => "Industry Coordinator", :imgurl => "people/weiwei.jpg"},

        {:name => "David Ly", :title => "Project Leader", :imgurl => "people/david_ly.png"},
        {:name => "Jagpinder Singh", :title => "General Member", :imgurl => "people/jagpinder_singh.jpg"},
        {:name => "Alan Liu", :title => "General Member", :imgurl => "people/alan_liu.jpg"},
        {:name => "Muying Chen", :title => "General Member", :imgurl => "people/muying_chen.jpg"},
        {:name => "Kyle Hua", :title => "General Member", :imgurl => "people/kyle_hua.png"},

        {:name => "Ashley Song", :title => "General Member", :imgurl => "people/ashley_song.jpg"},
        {:name => "Hiroaki Oshima", :title => "General Member", :imgurl => "people/hiroaki_oshima.png"},
        {:name => "Isha Mangal", :title => "General Member", :imgurl => "people/isha_mangal.jpg"},
        {:name => "Sun Ah Lee", :title => "General Member", :imgurl => "people/sunah_lee.png"},
        {:name => "Luciano Lopez", :title => "General Member", :imgurl => "people/luciano_lopez.jpg"},

        {:name => "Richard Huang", :title => "General Member", :imgurl => "people/richard_huang.jpg"},
        {:name => "Vincent Tantra", :title => "General Member", :imgurl => "people/vincent_tantra.JPG"},
        {:name => "Emily Wang", :title => "General Member", :imgurl => "people/emily_wang.jpg"},
        {:name => "Pranad Reddy", :title => "General Member", :imgurl => "people/pranad_reddy.jpg"},
        {:name => "Jennifer Xiao", :title => "General Member", :imgurl => "people/jennifer_xiao.jpg"},

        {:name => "Johnathan Zhou", :title => "General Member", :imgurl => "people/johnathan_zhou.png"},
        {:name => "Sai Kapuluru", :title => "General Member", :imgurl => "people/sai_kapuluru.jpg"},
        {:name => "Eric Jia", :title => "General Member", :imgurl => "people/eric_jia.jpg"},
        {:name => "Stella Lu", :title => "General Member", :imgurl => "people/stella_lu.png"},
        {:name => "Michael Chen", :title => "General Member", :imgurl => "people/michael_chen.png"},

        {:name => "David Paner", :title => "General Member", :imgurl => "people/david_paner.JPG"},
        {:name => "Ayush Maganahalli ", :title => "General Member", :imgurl => "people/maganahalli_ayush.png"},
        {:name => "Howie Ye", :title => "General Member", :imgurl => "people/haotian_ye.jpg"},
        {:name => "Emily Hu", :title => "General Member", :imgurl => "people/emily_hu.jpg"},
        {:name => "Jackie Chu", :title => "General Member", :imgurl => "people/jackie_chu.jpg"},

        {:name => "Snehpreet Kaur", :title => "General Member", :imgurl => "people/snehpreet_kaur.jpg"},
        {:name => "John Li", :title => "General Member", :imgurl => "people/wenyao_li.jpg"},
        {:name => "Kaavya Shah", :title => "General Member", :imgurl => "people/kaavya_shah.jpg"},
        {:name => "Alex Lazich", :title => "General Member", :imgurl => "people/alex_lazich.jpg"},
        {:name => "Thu Nguyen", :title => "General Member", :imgurl => "people/thu_nguyen.jpg"},

        {:name => "Dymtro Khelemendyk", :title => "General Member", :imgurl => "people/dmytro_khelemendyk.jpg"},
        {:name => "Jack Coyle", :title => "General Member", :imgurl => "people/jack_coyle.jpg"},
        {:name => "Asli Kalin", :title => "General Member", :imgurl => "people/aslihan_kalin.png"},
        {:name => "Karthick Ravikumar", :title => "General Member", :imgurl => "people/karthick_ravikumar.jpg"},
        {:name => "Lucas Liu", :title => "General Member", :imgurl => "people/lucas_liu.jpg"},

        {:name => "Natalia Layson", :title => "General Member", :imgurl => "people/natalia_layson.jpg"},
        {:name => "Anna Young", :title => "General Member", :imgurl => "people/anna_young.jpg"},
        {:name => "Harvey Woo", :title => "General Member", :imgurl => "people/harvey_woo.jpg"},
        {:name => "Kimmy Ko", :title => "General Member", :imgurl => "people/kimberly_ko.JPG"},
        {:name => "Albert Hu", :title => "General Member", :imgurl => "people/albert_hu.jpg"}


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
