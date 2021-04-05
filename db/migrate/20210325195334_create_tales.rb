class CreateTales < ActiveRecord::Migration[6.0]
  def change
    create_table :tales do |t|
      t.string :title
      t.text :description
      t.string :author
      t.integer :category_id

      t.timestamps
    end
  end
end
