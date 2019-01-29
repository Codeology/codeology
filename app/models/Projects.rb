class Projects
    # HARD CODED project names, blurbs, and image urls
    def choose(amount = 0)
        
=begin
        project_0 = {:name => "Automated Job Search", :imgurl => "projects/project_0.png", 
            :blurb => "Learn about the wonders of web scraping, APIs, and database management."}
        project_1 = {:name => "iOS Game Dev", :imgurl => "projects/project_1.png",
            :blurb => "Project members will learn how to use XCode and SWIFT to develop an iOS game."}
        project_2 = {:name => "Tensorflow Object Detection", :imgurl => "projects/project_2.png",
            :blurb => "Tensorflow based detection adapted to track custom objects through live video."}
        project_3 = {:name => "Receipt Reader", :imgurl => "projects/project_3.png",
            :blurb => "Use Google Vision API and RegEx to parse receipt image and split a bill among friends."}
        project_4 = {:name => "Audio Visualizer", :imgurl => "projects/project_4.png",
            :blurb => "Python based visualizer that reads input from a microphone and reacts to the sound."}
        project_5 = {:name => "Megaman Infinite Runner", :imgurl => "projects/project_5.png",
            :blurb => "Unity-based 2D Endless Runner Platformer using Megaman X sprites."}
        project_6 = {:name => "Portfolio Design & Dev", :imgurl => "projects/project_6.png",
            :blurb => "Design sprint and development with HTML/CSS/JS to create a deployable online portfolio for recruitment."}
=end
        project_0 = {:name => "Personal Portfolio", :imgurl => "projects/portfolio.jpg", 
            :blurb => "1 week of design and 3 weeks of development to create a deployable online portfolio for recruitment."}
        project_1 = {:name => "ML webdev", :imgurl => "projects/machinelearning.png",
            :blurb => "Build, deploy and interact with classification, feature extraction, and filtering models for clothing items."}
        project_2 = {:name => "Travel Scheduler", :imgurl => "projects/travel.png",
            :blurb => "Travel scheduling web app powered by various routing and graph algorithms."}
        project_3 = {:name => "Crave", :imgurl => "projects/nlp.png",
            :blurb => "Build an iOS app that utilizes an NLP chatbot to help users narrow down their preferences and discover new food"}
        project_4 = {:name => "Quant Trading Algorithms", :imgurl => "projects/quantopian.jpg",
            :blurb => "Build a stock market trading algorithm for US equities and backtest/deploy it on Quantopian against S&P 500"}
        project_5 = {:name => "Spotify Recommendations", :imgurl => "projects/spotify.jpg",
            :blurb => "Build models using data from Spotify’s API to get recommendations from any playlist."}
        project_6 = {:name => "Todo list iOS app", :imgurl => "projects/iphone.jpg",
            :blurb => "Intro to iOS app development to create a task list app with basic design implementation"}
        project_7 = {:name => "Blockchain Application", :imgurl => "projects/blockchain.png",
            :blurb => "Construct a DApp with different frameworks to create an online betting game."}
        project_8 = {:name => "Full stack Web Dev", :imgurl => "projects/webdev.jpg",
            :blurb => "Full stack responsive web app for finding buddies to walk home safely with."}
    
            array = [project_0, project_1, project_2, project_3, project_4, project_5, project_6, project_7, project_8]
        if amount == 3 then
            seed = rand(9)
            toReturn = []
            toReturn.push(array[seed], array[(seed + 3) % 7], array[(seed + 6) % 7])
        else
            toReturn = array
        end
        return toReturn
    end
end
