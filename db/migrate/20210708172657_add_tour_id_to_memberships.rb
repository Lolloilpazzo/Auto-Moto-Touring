class AddTourIdToMemberships < ActiveRecord::Migration[6.1]
  def change
    add_column :memberships, :tour_id, :integer
  end
end
