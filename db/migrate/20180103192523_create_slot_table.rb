class CreateSlotTable < ActiveRecord::Migration[5.0]
  def change
    create_table :slot_table do |t|
      t.integer :slot
    end
  end
end
