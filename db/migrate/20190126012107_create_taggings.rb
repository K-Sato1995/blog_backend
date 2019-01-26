class CreateTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :taggings do |t|
      t.references :tag
      t.references :post
      t.timestamps
    end
  end
end
