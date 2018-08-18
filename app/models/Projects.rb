class Projects
    # Hard coded project names and images
    def choose_three
        project_0 = {:name => "Automated Job Search", :imgurl => "project_0.png"}
        project_1 = {:name => "iOS Game Dev", :imgurl => "project_1.png"}
        project_2 = {:name => "Tensorflow Object Detection", :imgurl => "project_2.png"}
        project_3 = {:name => "Receipt Reader", :imgurl => "project_3.png"}
        project_4 = {:name => "Audio Visualizer", :imgurl => "project_4.png"}
        project_5 = {:name => "Megaman Infinite Runner", :imgurl => "project_5.png"}
        project_6 = {:name => "Portfolio Website Design & Development", :imgurl => "project_6.png"}
    
        array = [project_0, project_1, project_2, project_3, project_4, project_5, project_6]
        seed = rand(7)
        toReturn = []
        toReturn.push(array[seed], array[(seed + 3) % 7], array[(seed + 6) % 7])
        return toReturn
    end
end
