# Flight Booker Top

Flight Booker Top is a web application  built following The Odin Project RoR Course (link bellow). The app allows users to book flights (not real), there is some data in the seeds file to
populate the database.

[The Odin Project: Ruby on Rails Flight Booker](https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker). 

The Status of this repo is "finished" as it reaches the objectives set by the course but a lot of improvement could be made


# Features 

-User Authentication: The app uses the Devise gem for user authentication. (disabled)

-Database Structure: The database consists of tables for users, countries, cities, airports, flights, bookings, and passengers.

-Booking Flights: Users can search for available flights based on departure and arrival airports and select a flight to book.

-Viewing Flights: The main page displays a list of all available flights.


# How to use

### 1. Clone the Repository
### 2. Navigate to the Project Directory
### 3. Install Dependencies
  `bundle install`
  
  `yarn install`
  
### 4. Set Up the Database
   `rails db:setup`
### 5. Start the Rails Server
    `bin/dev`

### 6. Open a web browser and navigate to localhost:3000 to access the application.
