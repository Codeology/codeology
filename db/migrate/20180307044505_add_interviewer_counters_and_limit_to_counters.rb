class AddInterviewerCountersAndLimitToCounters < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :interviewing_curr_week, :integer, :default => 0
    add_column :users, :interviewing_next_week, :integer, :default => 0    
    add_column :users, :interviewing_limit, :integer, :default => 2
  end
end
