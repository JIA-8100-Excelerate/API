class AddShareToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :share, :boolean
    change_column_default :tasks, :share, false
  end
end
