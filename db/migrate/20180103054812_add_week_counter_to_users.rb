class AddWeekCounterToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :curr_week, :integer, :default => 0
    add_column :users, :next_week, :integer, :default => 0
  end
end
