class RemoveTaleIdFromRequest < ActiveRecord::Migration[6.0]
  def change
    remove_column :requests, :tale_id, :integer
  end
end
