class AddTaleIdToTaleContents < ActiveRecord::Migration[6.0]
  def change
    add_column :tale_contents, :tale_id, :integer
  end
end
