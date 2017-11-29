class AddNameToUserSkills < ActiveRecord::Migration[5.0]
  def change
    add_column :user_skills, :name, :string
  end
end
