class CreateNewFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.references :departure, foreign_key: { to_table: :airports }, null: false
      t.references :arrival, foreign_key: { to_table: :airports }, null: false
      t.date :date
      t.integer :duration
      t.timestamps
      
    end
  end
end
