class CreateMeetingGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :meeting_guests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :meeting, null: false, foreign_key: true
      t.integer :status
      
      t.timestamps
    end
  end
end
