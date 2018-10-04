class CorrectionOnPastTable < ActiveRecord::Migration[5.0]
  def change
    rename_column :past_interviews, :communnication_score, :communication_score
  end
end
