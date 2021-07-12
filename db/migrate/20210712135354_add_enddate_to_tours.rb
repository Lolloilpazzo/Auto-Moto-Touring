class AddEnddateToTours < ActiveRecord::Migration[6.1]
  def change
    add_column :tours, :enddate, :date
  end
end
