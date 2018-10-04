class RenamingSomeColumns < ActiveRecord::Migration[5.0]
  def change
  rename_column :past_interviews, :feedbackInterviewee, :feedback_interviewee
  rename_column :past_interviews, :feedbackInterviewer, :feedback_interviewer
  end
end
