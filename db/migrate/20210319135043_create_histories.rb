class CreateHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :histories do |t|
      t.integer :tale_id
      t.integer :user_id

      t.timestamps
    end
  end
end
