class AddLotsOfThingsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :email, unique: true
    add_column :users, :password_digest, :string
  end
end
