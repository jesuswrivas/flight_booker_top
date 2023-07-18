class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.references :country, foreign_key:true, null: false
      t.string :name
      t.timestamps
    end
  end
end
