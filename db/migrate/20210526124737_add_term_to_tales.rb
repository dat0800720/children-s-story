class AddTermToTales < ActiveRecord::Migration[6.0]
  def change
    add_column :tales, :term, :integer
  end
end
