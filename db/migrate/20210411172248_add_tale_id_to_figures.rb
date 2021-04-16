class AddTaleIdToFigures < ActiveRecord::Migration[6.0]
  def change
    add_column :figures, :tale_id, :integer
  end
end
