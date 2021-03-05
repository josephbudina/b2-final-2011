class Flight < ApplicationRecord
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers

  def self.order_by_departure
    order(:departure_city)
  end

  def find_average_passenger_age
    passengers
    .average(:age)
    .to_i
  end

  # def self.order_by_passenger_count
  #   joins(:flight_passengers)
  #   .group('flight_passengers.flight_id')
  #   .select('flights.*, count(*) as passenger_count')
  #   .order('passenger_count desc')
  # end
end