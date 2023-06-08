class AddStatusToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :status, :integer
  end
end
