class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.integer :number
      t.string :date
      t.string :time
      t.references :airline, foreign_key: true
      t.string :departure
      t.string :arrival

      t.timestamps
    end
  end
end
