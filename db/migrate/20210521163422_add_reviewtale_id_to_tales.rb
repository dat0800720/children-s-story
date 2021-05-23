class AddReviewtaleIdToTales < ActiveRecord::Migration[6.0]
  def change
    add_column :tales, :reviewtale_id, :integer
  end
end
