class AddIntroductionToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :introduction, :text
  end
end
