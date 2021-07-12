class AddDurationToStops < ActiveRecord::Migration[6.1]
  def change
    add_column :stops, :duration, :string
  end
end
