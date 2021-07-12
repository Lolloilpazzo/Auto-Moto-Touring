class AddUserIdToMemberships < ActiveRecord::Migration[6.1]
  def change
    add_column :memberships, :user_id, :integer
  end
end
