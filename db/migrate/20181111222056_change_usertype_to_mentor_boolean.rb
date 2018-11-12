class ChangeUsertypeToMentorBoolean < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :usertype
    add_column :users, :mentor, :boolean
  end
end
