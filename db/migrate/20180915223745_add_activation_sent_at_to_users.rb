class AddActivationSentAtToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :activation_sent_at, :datetime
  end
end
