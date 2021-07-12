class AddDescriptionToTours < ActiveRecord::Migration[6.1]
  def change
    add_column :tours, :description, :text
  end
end
