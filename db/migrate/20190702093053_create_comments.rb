class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :name
      t.string :content
      t.integer :status, null: false, default: 0
      t.references :post
      t.timestamps
    end
  end
end
