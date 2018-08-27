class AddUserIdToSlotTable < ActiveRecord::Migration[5.0]
  def change
    add_reference :slot_table, :user, index: true
    add_foreign_key :slot_table, :users
  end
end
