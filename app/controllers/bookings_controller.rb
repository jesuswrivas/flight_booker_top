class BookingsController < ApplicationController


    def new
        @number_of_passengers = params[:booking][:passengers].to_i       
        @flight = Flight.find(params[:booking][:flight_id])
        @booking = Booking.new(flight_id: params[:booking][:flight_id])
        @number_of_passengers.times{@booking.passengers.build}
    
    end


     def create
        @booking = Booking.new(booking_params)
       
        if @booking.save
          redirect_to root_path, notice: "Booking successful"
        else
            redirect_to root_path, alert: "Something went wrong, we couldn't book your flight"
          
        end
      end
  

    private
 
    def booking_params
        params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
      end



end
