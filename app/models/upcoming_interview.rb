class Upcoming_interview < ApplicationRecord
    
    # method unused but left for reference
    def prune_upcoming
        upcomingInterviews = Upcoming_interview.where("time <= ?", Time.now)
        upcomingInterviews.each do |upcoming|
            @past_interview = Past_interview.new(interviewee: upcoming.interviewee, interviewer: upcoming.interviewer, time: upcoming.time,
                                                  technical_score: 0, communication_score: 0, problem_solving_score: 0,
                                                  excitement_score: 0, question_score: 0, helpfulness_score: 0,
                                                  is_python: upcoming.is_python, is_videocall: upcoming.is_videocall)
            @past_interview.save
        end
    end
end
