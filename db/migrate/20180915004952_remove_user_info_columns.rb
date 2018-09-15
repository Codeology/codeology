class RemoveUserInfoColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :title
    remove_column :users, :bio
    remove_column :users, :is_officer
    remove_column :users, :email_confirmed
    remove_column :users, :confirm_token
  end
end
