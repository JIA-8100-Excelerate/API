class RemoveStudentsFromTask < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :students, :text
  end
end
