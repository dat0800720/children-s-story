class RemoveSendIdAndReceivedIdFromRequest < ActiveRecord::Migration[6.0]
  def change
    remove_column :requests, :send_id, :integer
    remove_column :requests, :received_id, :integer
  end
end
