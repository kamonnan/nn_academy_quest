class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :content
      t.boolean :completed

      t.timestamps
    end
    add_index :tasks, :completed
  end
end
