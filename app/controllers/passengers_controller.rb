class PassengersController < ApplicationController
  def show
    @passenger = Passenger.find(params[:id])
    @flights = Flight.all
  end
end
