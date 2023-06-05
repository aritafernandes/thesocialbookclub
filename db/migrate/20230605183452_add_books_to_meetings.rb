class AddBooksToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_reference :meetings, :book, null: false, foreign_key: true
  end
end
