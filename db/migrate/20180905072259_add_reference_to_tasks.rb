class AddReferenceToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference(:tasks, :goals, foreign_key: true)
  end
end
