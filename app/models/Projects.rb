class Projects
    # HARD CODED project names, blurbs, and image urls
    def choose_three
        project_0 = {:name => "Automated Job Search", :imgurl => "project_0.png", 
            :blurb => "Learn about the wonders of web scraping, APIs, and database management."}
        project_1 = {:name => "iOS Game Dev", :imgurl => "project_1.png",
            :blurb => "Project members will learn how to use XCode and SWIFT to develop an iOS game."}
        project_2 = {:name => "Tensorflow Object Detection", :imgurl => "project_2.png",
            :blurb => "Tensorflow based object detection adapted to track custom objects through live video feed."}
        project_3 = {:name => "Receipt Reader", :imgurl => "project_3.png",
            :blurb => "Use Google Vision API and RegEx to parse receipt image and split a bill among friends."}
        project_4 = {:name => "Audio Visualizer", :imgurl => "project_4.png",
            :blurb => "Python based visualizer that reads input from a microphone and reacts to the sound."}
        project_5 = {:name => "Megaman Infinite Runner", :imgurl => "project_5.png",
            :blurb => "Unity-based 2D Endless Runner Platformer using Megaman X sprites."}
        project_6 = {:name => "Portfolio Design & Development", :imgurl => "project_6.png",
            :blurb => "Design sprint and development with HTML/CSS/JS to create a deployable online portfolio for recruitment."}
    
        array = [project_0, project_1, project_2, project_3, project_4, project_5, project_6]
        seed = rand(7)
        toReturn = []
        toReturn.push(array[seed], array[(seed + 3) % 7], array[(seed + 6) % 7])
        return toReturn
    end
end
