class AddLanguageToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :language, :integer, default: 0
  end
end
