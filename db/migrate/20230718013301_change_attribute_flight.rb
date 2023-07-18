class ChangeAttributeFlight < ActiveRecord::Migration[7.0]
  def change
    change_column :flights, :date, :integer, using: 'extract(epoch from date)::integer'
  end
end
