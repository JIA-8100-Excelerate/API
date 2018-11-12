class ChangeMenteeToString < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :mentee, :string
  end
end
