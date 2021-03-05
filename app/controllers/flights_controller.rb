class FlightsController < ApplicationController
  def index
    @flights = Flight.all
  end

  def show
    @flight = Flight.find(params[:id])
  end

  def destroy
    @flight = Flight.find(params[:id])
    @flight.flight_passengers.delete(params[:passenger_id])
    redirect_to flight_path(@flight)
  end
end