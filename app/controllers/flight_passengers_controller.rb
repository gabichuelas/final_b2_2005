class FlightPassengersController < ApplicationController
  def create
    FlightPassenger.create(flight_id: params[:flights], passenger_id: params[:passenger])
    redirect_to "/passengers/#{params[:passenger]}"
  end
end
