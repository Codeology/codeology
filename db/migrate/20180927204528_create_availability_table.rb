class CreateAvailabilityTable < ActiveRecord::Migration[5.0]
  def change
    create_table :availability_table do |t|
      t.datetime :time
    end
    
    add_reference :availability_table, :user, index: true
    add_foreign_key :availability_table, :users
  end
end
