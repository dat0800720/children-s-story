class CreateTaleFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :tale_follows do |t|
      t.integer :tale_id
      t.integer :user_id

      t.timestamps
    end
    add_index :tale_follows, :user_id
    add_index :tale_follows, :tale_id
    add_index :tale_follows, [:user_id, :tale_id], unique: true
  end
end
