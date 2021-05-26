class RemoveTermAndReviewtaleIdFromTale < ActiveRecord::Migration[6.0]
  def change
    remove_column :tales, :term, :integer
    remove_column :tales, :reviewtale_id, :integer
  end
end
