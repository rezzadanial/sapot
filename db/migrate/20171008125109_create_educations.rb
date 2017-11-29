class CreateEducations < ActiveRecord::Migration[5.0]
  def change
    create_table :educations do |t|
      t.string :institure_name
      t.text :description

      t.timestamps
    end
  end
end
