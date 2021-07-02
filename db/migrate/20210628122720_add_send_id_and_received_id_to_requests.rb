class AddSendIdAndReceivedIdToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :send_id, :integer
    add_column :requests, :received_id, :integer
  end
end
