class AddUserIdToTours < ActiveRecord::Migration[6.1]
  def change
    add_column :tours, :user_id, :integer
    add_index :tours, :user_id
  end
end
