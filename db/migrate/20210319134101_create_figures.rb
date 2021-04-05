class CreateFigures < ActiveRecord::Migration[6.0]
  def change
    create_table :figures do |t|
      t.string :name

      t.timestamps
    end
  end
end
