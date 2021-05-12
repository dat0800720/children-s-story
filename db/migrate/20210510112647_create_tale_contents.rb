class CreateTaleContents < ActiveRecord::Migration[6.0]
  def change
    create_table :tale_contents do |t|
      t.string :text
      t.integer :content_type, default: 0

      t.timestamps
    end
  end
end
