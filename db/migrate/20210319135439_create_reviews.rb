class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :tale_id
      t.integer :user_id
      t.integer :vote_id
      t.integer :follow_id
      t.integer :author

      t.timestamps
    end
  end
end
