class AddVehicleToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :vehicle, :string
  end
end
