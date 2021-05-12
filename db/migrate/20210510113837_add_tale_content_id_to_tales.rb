class AddTaleContentIdToTales < ActiveRecord::Migration[6.0]
  def change
    add_column :tales, :tale_content_id, :integer
  end
end
