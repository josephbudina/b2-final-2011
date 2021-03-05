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
end