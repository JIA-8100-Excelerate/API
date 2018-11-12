class MentorDefaultToFalse < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :mentor, false
  end
end
