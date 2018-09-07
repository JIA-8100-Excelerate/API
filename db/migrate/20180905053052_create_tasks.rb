class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :students, default: [].to_yaml
      t.boolean :done
      t.references :goal, foreign_key: true

      t.timestamps
    end
  end
end
