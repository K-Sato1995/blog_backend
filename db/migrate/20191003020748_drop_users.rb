class DropUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table :users, force: :cascade do |t|
      t.string :name
      t.integer :status
      t.timestamps
    end
  end
end
