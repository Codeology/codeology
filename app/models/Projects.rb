class Projects
    # HARD CODED project names, blurbs, and image urls
    def choose(amount = 0)

        project_0 = {:name => "Personal Website", :imgurl => "projects/portfolio.jpg",
            :blurb => "Build your own cool, personal website from scratch using HTML, CSS, JavaScript, and jQuery!"}
        project_1 = {:name => "Music Generation", :imgurl => "projects/musicGeneration.jpg",
            :blurb => "Explore introductory ML and neural network concepts and apply your newfound knowledge to generate your own music!"}
        project_2 = {:name => "Whatcha Wanna Do", :imgurl => "projects/whatchaWanna.jpg",
            :blurb => "Bored and not sure what you want to do? This website searches through Eventbrite to create a schedule for you to get out there and explore!"}
        project_3 = {:name => "Unity Development", :imgurl => "projects/unityDev.jpg",
            :blurb => "Learn game development with a team of other developers using C# and Unity."}
        project_4 = {:name => "Movie Recommendations", :imgurl => "projects/movieRecs.jpg",
            :blurb => "Build a movie recommendation engine using filtering algorithms and visualize it on an interactive Tableau dashboard."}
        project_5 = {:name => "Web Reacts Only", :imgurl => "projects/webReacts.jpg",
            :blurb => "Learn how to start building basic Web apps with a focus on React and API calls!"}
        project_6 = {:name => "Rethinking CS", :imgurl => "projects/bigBrain.jpg",
            :blurb => "Learn about what goes into the process of designing an app! We will cover topics like ui/ux, design theory, user interaction, and much more!"}

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
