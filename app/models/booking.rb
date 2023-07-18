class Booking < ApplicationRecord
    attr_accessor :passengers

    belongs_to :flight
    belongs_to :passenger

end
