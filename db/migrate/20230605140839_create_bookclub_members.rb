class CreateBookclubMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :bookclub_members do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bookclub, null: false, foreign_key: true

      t.timestamps
    end
  end
end
