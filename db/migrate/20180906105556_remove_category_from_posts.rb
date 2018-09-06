class RemoveCategoryFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :category, :string
  end
end
