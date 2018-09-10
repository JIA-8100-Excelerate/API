class RemoveExtraIndexFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_index :tasks, :goals_id
  end
end
