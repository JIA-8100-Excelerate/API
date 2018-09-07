class RemoveReferenceFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_reference(:tasks, :goals, index: true, foreign_key: true)
  end
end
