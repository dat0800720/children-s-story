class CreateFavourites < ActiveRecord::Migration[6.0]
  def change
    create_table :favourites do |t|
      t.integer :favouriter_id
      t.integer :favourited_id

      t.timestamps
    end
    add_index :favourites, :favouriter_id
    add_index :favourites, :favourited_id
    add_index :favourites, [:favouriter_id, :favourited_id], unique: true
  end
end
