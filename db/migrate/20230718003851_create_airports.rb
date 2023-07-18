class CreateAirports < ActiveRecord::Migration[7.0]
  def change
    create_table :airports do |t|
      t.references :city, foreign_key: true, null: false
      t.string :name
      t.string :code
      t.timestamps
    end
  end
end
