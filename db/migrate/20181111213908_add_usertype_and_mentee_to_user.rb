class AddUsertypeAndMenteeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :usertype, :string
    add_column :users, :mentee, :integer
  end
end
