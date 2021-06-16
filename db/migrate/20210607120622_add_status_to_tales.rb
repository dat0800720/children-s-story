class AddStatusToTales < ActiveRecord::Migration[6.0]
  def change
    add_column :tales, :status, :integer, default: 0
  end
end
