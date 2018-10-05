class AddingLanguageAndLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :availabilities, :is_python, :boolean
    add_column :availabilities, :is_videocall, :boolean

    add_column :upcoming_interviews, :is_python, :boolean
    add_column :upcoming_interviews, :is_videocall, :boolean

    add_column :past_interviews, :is_python, :boolean
    add_column :past_interviews, :is_videocall, :boolean
  end
end
