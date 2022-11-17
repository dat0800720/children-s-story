class AddReasonRejectToTales < ActiveRecord::Migration[6.0]
  def change
    add_column :tales, :reason_reject, :string
  end
end
