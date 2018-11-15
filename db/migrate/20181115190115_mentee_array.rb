class MenteeArray < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :mentee
    add_column :users, :mentees, :string, array: true, default: '{}'
  end
end
