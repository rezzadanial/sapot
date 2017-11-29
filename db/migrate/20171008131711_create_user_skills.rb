class CreateUserSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :user_skills do |t|
      t.integer :user_id
      t.string :skill

      t.timestamps
    end
  end
end
