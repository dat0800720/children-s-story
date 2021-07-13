class AddTaleIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :tale_id, :integer
  end
end
