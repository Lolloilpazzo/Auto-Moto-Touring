class CreateStops < ActiveRecord::Migration[6.1]
  def change
    create_table :stops do |t|
      t.integer :postition
      t.string :address
      t.decimal :latitude
      t.decimal :longitude
      t.date :arrival_date
      t.references :tour, null: false, foreign_key: true

      t.timestamps
    end
  end
end
