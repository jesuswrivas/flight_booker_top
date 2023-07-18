class Passenger < ApplicationRecord

    has_many :bookings
    has_one :flight, through: :bookings

end
