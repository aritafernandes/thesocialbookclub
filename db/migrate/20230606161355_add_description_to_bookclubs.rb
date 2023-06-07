class AddDescriptionToBookclubs < ActiveRecord::Migration[7.0]
  def change
    add_column :bookclubs, :description, :text
  end
end
