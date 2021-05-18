class DropTableTaleFollows < ActiveRecord::Migration[6.0]
  def change
    drop_table :tale_follows
  end
end
