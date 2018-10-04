class ChangingAvailabilityTableNameAgain < ActiveRecord::Migration[5.0]
  def change
    rename_table :availabilitys, :availabilities

  end
end
