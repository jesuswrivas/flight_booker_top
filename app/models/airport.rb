class Airport < ApplicationRecord
    belongs_to :city

    has_many :arriving_flights, foreign_key: "arrival_id", class_name: "Flight"
    has_many :departing_flights, foreign_key: "departure_id", class_name: "Flight"

end
