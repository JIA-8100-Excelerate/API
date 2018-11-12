class AddSuggestionToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :suggestion, :boolean
  end
end
