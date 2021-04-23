class AddPicturesIdToTale < ActiveRecord::Migration[6.0]
  def change
    add_column :tales, :picture_id, :integer
  end
end
