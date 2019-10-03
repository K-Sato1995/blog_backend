class AddIndexToAuthorsEmail < ActiveRecord::Migration[6.0]
  def change
    add_index :authors, :email, unique: true
  end
end
