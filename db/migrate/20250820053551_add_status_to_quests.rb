class AddStatusToQuests < ActiveRecord::Migration[8.0]
  def change
    add_column :tasks, :status, :boolean, default: false
  end
end
