class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.string :book_title
      t.string :location
      t.string :video_link
      t.datetime :date_time
      t.references :bookclub, null: false, foreign_key: true

      t.timestamps
    end
  end
end
