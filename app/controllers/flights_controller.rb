class FlightsController < ApplicationController


    def index
        @flight = Flight.new
        @countries = Country.all
        
        
        if flight_params
            @flight = Flight.new(flight_params)
            @list_of_flights = Flight.flight_look_up(flight_params)

            render :index
        else
            render :index
        end
       
            
        
    end





    private


    def flight_params
            params.require(:flight).permit(:departure_id, :arrival_id, :date)

    end




end
