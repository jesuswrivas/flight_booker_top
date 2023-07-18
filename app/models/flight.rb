class Flight < ApplicationRecord


    attr_accessor :passengers

    belongs_to :arrival, class_name: "Airport"
    belongs_to :departure, class_name: "Airport"

    has_many :bookings
    has_many :passengers, through: :bookings






    def self.flight_look_up(flight_data)

        correct_destination = Flight.where(departure_id: flight_data[:departure_id], arrival_id: flight_data[:arrival_id])
        aprox_flights = correct_destination.where(date: (flight_data[:date].to_date - 15).. flight_data[:date].to_date+ 15)

        return aprox_flights

    end







end


