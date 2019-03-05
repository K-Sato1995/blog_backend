class AddLikeToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :like, :integer, default: 0
  end
end
