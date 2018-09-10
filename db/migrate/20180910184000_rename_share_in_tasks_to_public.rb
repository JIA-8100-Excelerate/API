class RenameShareInTasksToPublic < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :share, :public
  end
end
