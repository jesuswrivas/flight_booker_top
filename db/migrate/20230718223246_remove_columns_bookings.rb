class RemoveColumnsBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column(:bookings, :passenger_name)
    remove_column(:bookings, :passenger_email)
  end
end
