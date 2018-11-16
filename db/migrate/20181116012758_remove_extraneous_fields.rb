class RemoveExtraneousFields < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :done
    remove_column :tasks, :public
    remove_column :tasks, :suggestion
  end
end
