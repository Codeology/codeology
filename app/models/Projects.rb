class Projects
    # HARD CODED project names, blurbs, and image urls
    def choose(amount = 0)

        project_0 = {:name => "Personal Website", :imgurl => "projects/portfolio.jpg",
            :blurb => "Build your own personal website from scratch! We will be using HTML, CSS, and JavaScript, and no prior experience is necessary. Also learn about web design principles such as spacing, color, and typography."}
        project_1 = {:name => "Small Monkey Brain React Reward Project", :imgurl => "projects/smallBrain.jpg",
            :blurb => "Want to land that sweet sweet tech internship but you're on Youtube too much to grind leetcode? Need to write that final paper but you've been on Instagram for the past 13 hours? Build strong study habits through cycles of positive reinforcement and questionably negative reinforcement! Small Monkey Brain React Reward Project is a Google Chrome extension built with React to make sure you're on track when you study."}
        project_2 = {:name => "Balling with Data", :imgurl => "projects/ballin.png",
            :blurb => "Have you ever looked up to the stars and wondered to yourself, what could've been if your favorite NBA team knew how to draft players? Well, if you're a Knicks fan, you know exactly what we're talking about.   In this project, Matt and Calvin will be combining their two of their favorite topics, data science and basketball, to demonstrate how we can work with NCAA and NBA data today to predict the next best rookies to transform the NBA. We'll be covering a variety of different data science topics, from data collection to feature engineering to modeling, in order to finally showcase a prediction for the 2020 NBA Draft backed completely by data! Now, you'll be able to take your fool-proof predictions to your local GM, and convince them to finally learn how to tank properly and which player will best fit their team in the upcoming season."}
        project_3 = {:name => "Predicting Film Success", :imgurl => "projects/filmSuccess.jpg",
            :blurb => "This project will start with collecting and preparing data from movie reviews. We'll do some sentiment analysis on the data and build a model that predicts whether movies will be successful or not based on their reviews."}
        project_4 = {:name => "Unity RPG", :imgurl => "projects/unityRPG.png",
            :blurb => "In this project, we're going to be building an RPG that allows the player to travel around an expansive world, fight monsters, take on quests and progress to their wildest dreams! Using the Unity Engine and C# language, taking inspiration from Maplestory and other MMORPG's, our team hopes to build an immersive experience that's going to suck you right in."}
        project_5 = {:name => "Chatbot", :imgurl => "projects/chatbot.jpg",
            :blurb => "Create your own Facebook Messenger Chatbot that uses Natural Language Processing to accurately respond to messages. This project will use the Facebook Messenger APIs as well as other Machine Learning API's to create a chatbot that you can actually speak to and converse with. Deploy your own chatbot that can give you compliments, help you pick out shoes, etc.!"}
        project_6 = {:name => "It's a Gentrified Day in the Neighborhood: Predicting Gentrification", :imgurl => "projects/gentrification.jpg",
            :blurb => "This project addresses the issue of gentrification by identifying areas where it is occurring as well as predicting where else gentrification might be happening. Gentrification will be assessed as a calculation based on the following 6 demographic measures: % change in gross income, % change non-Latinx White residents, % change in average household size, % change in gross rent, % change in residents with Bachelor's degrees, and % change in IRS filer ratio. Tableau visualization software will be used to illustrate the trends in US Demographics data that portray the severity of gentrification's in a given area."}

            array = [project_0, project_1, project_2, project_3, project_4, project_5, project_6]
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
