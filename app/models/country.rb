class Country < ApplicationRecord
    has_many :cities
    has_many :airports, through: :cities
end
