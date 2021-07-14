class RemoveTaleIdFormUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :tale_id, :integer
  end
end
