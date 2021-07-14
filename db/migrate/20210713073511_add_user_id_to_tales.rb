class AddUserIdToTales < ActiveRecord::Migration[6.0]
  def change
    add_column :tales, :user_id, :integer
  end
end
