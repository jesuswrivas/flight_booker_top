# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


countries = [
    "Argentina",
    "Bolivia",
    "Brazil",
    "Chile",
    "Colombia",
    "Ecuador",
    "Guyana",
    "Paraguay",
    "Peru",
    "Suriname",
    "Uruguay",
    "Venezuela"
  ];


  cities = [
    { country_name: "Argentina", capital: "Buenos Aires", other_city: "Cordoba" },
    { country_name: "Bolivia", capital: "La Paz", other_city: "Santa Cruz" },
    { country_name: "Brazil", capital: "Brasilia", other_city: "Rio de Janeiro" },
    { country_name: "Chile", capital: "Santiago", other_city: "Valparaiso" },
    { country_name: "Colombia", capital: "Bogota", other_city: "Medellin" },
    { country_name: "Ecuador", capital: "Quito", other_city: "Guayaquil" },
    { country_name: "Guyana", capital: "Georgetown", other_city: "Linden" },
    { country_name: "Paraguay", capital: "Asuncion", other_city: "Ciudad del Este" },
    { country_name: "Peru", capital: "Lima", other_city: "Arequipa" },
    { country_name: "Suriname", capital: "Paramaribo", other_city: "Nieuw Nickerie" },
    { country_name: "Uruguay", capital: "Montevideo", other_city: "Punta del Este" },
    { country_name: "Venezuela", capital: "Caracas", other_city: "Maracaibo" }
  ]

  airports = [
    { city_name: "Buenos Aires", airport_name: "Ministro Pistarini International Airport", code: "EZE" },
    { city_name: "La Paz", airport_name: "El Alto International Airport", code: "LPB" },
    { city_name: "Brasilia", airport_name: "Brasilia International Airport", code: "BSB" },
    { city_name: "Santiago", airport_name: "Comodoro Arturo Merino Benitez International Airport", code: "SCL" },
    { city_name: "Bogota", airport_name: "El Dorado International Airport", code: "BOG" },
    { city_name: "Quito", airport_name: "Mariscal Sucre International Airport", code: "UIO" },
    { city_name: "Georgetown", airport_name: "Cheddi Jagan International Airport", code: "GEO" },
    { city_name: "Asuncion", airport_name: "Silvio Pettirossi International Airport", code: "ASU" },
    { city_name: "Lima", airport_name: "Jorge Chavez International Airport", code: "LIM" },
    { city_name: "Paramaribo", airport_name: "Johan Adolf Pengel International Airport", code: "PBM" },
    { city_name: "Montevideo", airport_name: "Carrasco International Airport", code: "MVD" },
    { city_name: "Caracas", airport_name: "Simon Bolivar International Airport", code: "CCS" },
    { city_name: "Cordoba", airport_name: "Ingeniero Aeronautico Ambrosio L.V. Taravella International Airport", code: "COR" },
    { city_name: "Santa Cruz", airport_name: "Viru Viru International Airport", code: "VVI" },
    { city_name: "Rio de Janeiro", airport_name: "Rio de Janeiro-Galeao International Airport", code: "GIG" },
    { city_name: "Valparaiso", airport_name: "Arturo Merino Benitez International Airport", code: "VAP" },
    { city_name: "Medellin", airport_name: "Jose Maria Cordova International Airport", code: "MDE" },
    { city_name: "Guayaquil", airport_name: "Jose Joaquin de Olmedo International Airport", code: "GYE" },
    { city_name: "Ciudad del Este", airport_name: "Guarani International Airport", code: "AGT" },
    { city_name: "Arequipa", airport_name: "Rodriguez Ballon International Airport", code: "AQP" },
    { city_name: "Nieuw Nickerie", airport_name: "Nieuw Nickerie Airport", code: "ICK" },
    { city_name: "Punta del Este", airport_name: "Capitan de Corbeta Carlos A. Curbelo International Airport", code: "PDP" },
    { city_name: "Maracaibo", airport_name: "La Chinita International Airport", code: "MAR" }
  ]
  








#############Countries Generator ############

countries.each do |country|
  Country.create(name: country)
end


#############Cities Generator######################
  
  cities.each do |city_data|
    country = Country.find_by(name: city_data[:country_name])
  
    new_city = City.new(name: city_data[:capital])
    new_city.country = country
    new_city.save
  
    new_city = City.new(name: city_data[:other_city])
    new_city.country = country
    new_city.save
  end


############################ Airports Generator############################


airports.each do |airport_data|
    city = City.find_by(name: airport_data[:city_name])
  
    new_airport = Airport.new(name: airport_data[:airport_name], code: airport_data[:code])
    new_airport.city = city
    new_airport.save
  end
  
  
  #Flights generator 

  departure_airports = Airport.all
  arrival_airports = Airport.all
  number_of_dates = 5
  
  departure_airports.find_each do |departure|
    arrival_airports.find_each do |arrival|
      next if departure == arrival # Skip if departure and arrival airports are the same
  
      number_of_dates.times do
        random_date = Date.today + rand(180)
        start_datetime = DateTime.new(random_date.year, random_date.month, random_date.day, rand(0..23), rand(0..59))
        duration = rand(3..8)
  
        Flight.create!(
          departure_id: departure.id,
          arrival_id: arrival.id,
          date: start_datetime,
          duration: duration
        )
      end
    end
  end
  