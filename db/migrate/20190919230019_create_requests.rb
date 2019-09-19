class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.datetime :time
      t.boolean  :is_python
      t.boolean  :is_videocall
    end

    add_reference :requests, :user, index: true
    add_foreign_key :requests, :users
  end
end
