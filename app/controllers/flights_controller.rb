class FlightsController < ApplicationController


    def index
       
        # Two cases for the index request

        unless params[:flight]
            #First time. No searching in the form
            @flight = Flight.new
            @countries = Country.all
        else
             #There is search going on. The app goes here once the form is submitted (flight_params are present)
             if params[:flight].to_unsafe_h.any? { |key, value| value.empty? }
                redirect_to root_path, alert: "Please, fill up all the fields" and return
            end

            @flight = Flight.new(flight_params)
            @list_of_flights = Flight.flight_look_up(flight_params)
            @booking = Booking.new  
            render :index
        end


        
        
    end





    private


    def flight_params
        if params[:flight]
            params.require(:flight).permit(:departure_id, :arrival_id, :date, :passengers)
        else
            nil
        end
    end

   



end
