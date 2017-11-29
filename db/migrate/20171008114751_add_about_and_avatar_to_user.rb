class AddAboutAndAvatarToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :about, :text
    add_column :users, :avatar, :string
  end
end
