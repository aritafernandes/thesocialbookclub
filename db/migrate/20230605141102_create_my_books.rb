class CreateMyBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :my_books do |t|
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
