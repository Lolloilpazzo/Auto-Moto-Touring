class CreateTours < ActiveRecord::Migration[6.1]
  def change
    create_table :tours do |t|
      t.string :Autista
      t.string :Mezzo_Di_Trasporto
      t.date :Data
      t.string :Partenza
      t.string :destinazione
      t.string :durata
      t.integer :Posti_Disponibili

      t.timestamps
    end
  end
end
