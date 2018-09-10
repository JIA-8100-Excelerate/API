class RemoveGoalsIdFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :goals_id, :integer
  end
end
