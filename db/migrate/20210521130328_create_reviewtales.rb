class CreateReviewtales < ActiveRecord::Migration[6.0]
  def change
    create_table :reviewtales do |t|
      t.integer :tale_id
      t.integer :user_id
      t.integer :rating
      t.string :comment
      
      t.timestamps
    end
  end
end
