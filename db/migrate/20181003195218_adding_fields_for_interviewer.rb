class AddingFieldsForInterviewer < ActiveRecord::Migration[5.0]
  def change
    rename_column :past_interviews, :feedback, :feedbackInterviewee
    add_column :past_interviews, :excitement_score, :integer
    add_column :past_interviews, :question_score, :integer
    add_column :past_interviews, :helpfulness_score, :integer
    add_column :past_interviews, :feedbackInterviewer, :text
  end
end
