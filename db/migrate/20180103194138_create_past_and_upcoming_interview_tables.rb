class CreatePastAndUpcomingInterviewTables < ActiveRecord::Migration[5.0]
  def change
    create_table :past_interviews do |t|
      t.integer :technical_score
      t.integer :communnication_score
      t.integer :problem_solving_score
      t.string :feedback
      t.integer :slot
      t.integer :date
    end

    create_table :upcoming_interviews do |t|
      t.integer :slot        
    end
  end
end
