class AddAdminToBookclubMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :bookclub_members, :admin, :boolean, default: false
  end
end
