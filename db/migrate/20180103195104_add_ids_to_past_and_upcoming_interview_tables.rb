class AddIdsToPastAndUpcomingInterviewTables < ActiveRecord::Migration[5.0]
  def change
    add_column :past_interviews, :interviewee, :integer
    add_column :past_interviews, :interviewer, :integer
    add_column :upcoming_interviews, :interviewee, :integer
    add_column :upcoming_interviews, :interviewer, :integer
  end
end
