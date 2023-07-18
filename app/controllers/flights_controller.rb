class FlightsController < ApplicationController


    def index
    
        if flight_params
            @countries = Country.all
            @booking = Booking.new
            @flight = Flight.new(flight_params)
         
            @list_of_flights = Flight.flight_look_up(flight_params)
           
            render :index
        else
            @flight = Flight.new
            @countries = Country.all
            @booking = Booking.new

            render :index
        end
                  
        
    end





    private


    def flight_params
            params.require(:flight).permit(:departure_id, :arrival_id, :date, :passengers)

    end





end
