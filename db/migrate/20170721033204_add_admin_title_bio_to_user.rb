class AddAdminTitleBioToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :title, :string
    add_column :users, :bio, :text
  end
end
