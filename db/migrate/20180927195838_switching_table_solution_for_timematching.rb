class SwitchingTableSolutionForTimematching < ActiveRecord::Migration[5.0]
  def change
    remove_column :past_interviews, :slot
    remove_column :past_interviews, :feedback
    remove_column :past_interviews, :date
    add_column :past_interviews, :time, :datetime
    add_column :past_interviews, :feedback, :text

    remove_column :upcoming_interviews, :slot
    add_column :upcoming_interviews, :time, :datetime

    remove_column :users, :curr_week
    remove_column :users, :next_week
    remove_column :users, :interviewing_curr_week
    remove_column :users, :interviewing_next_week
    remove_column :users, :interviewing_limit

    drop_table :slot_table
  end
end
