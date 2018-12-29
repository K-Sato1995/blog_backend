class AddPageViewToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :page_views, :integer, default: 0
  end
end
