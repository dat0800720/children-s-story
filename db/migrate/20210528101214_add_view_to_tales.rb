class AddViewToTales < ActiveRecord::Migration[6.0]
  def change
    add_column :tales, :view, :integer
  end
end
