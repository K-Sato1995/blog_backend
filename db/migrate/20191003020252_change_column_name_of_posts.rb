class ChangeColumnNameOfPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :user_id, :author_id
  end
end
