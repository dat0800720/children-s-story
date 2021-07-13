class ChangNameColumnAuthorInTales < ActiveRecord::Migration[6.0]
  def change
    rename_column :tales, :author, :author_user
  end
end
