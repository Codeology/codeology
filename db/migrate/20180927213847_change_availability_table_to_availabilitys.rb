class ChangeAvailabilityTableToAvailabilitys < ActiveRecord::Migration[5.0]
  def change
    rename_table :availability_table, :availabilitys
  end
end
