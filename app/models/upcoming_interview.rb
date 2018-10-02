class Upcoming_interview < ApplicationRecord
    
    # method unused but left for reference
    def prune_upcoming
        upcomingInterviews = Upcoming_interview.where("time <= ?", Time.now)
        upcomingInterviews.each do |upcoming|
            @past_interview = Past_interview.new(interviewee: upcoming.interviewee, interviewer: upcoming.interviewer, time: upcoming.time)
            @past_interview.save
        end
    end
end
