class RemoveIntroFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :intro, :text
  end
end
