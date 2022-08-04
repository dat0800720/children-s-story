class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :tale_id
      t.integer :user_id
      t.string :content

      t.timestamps
    end
  end
end
