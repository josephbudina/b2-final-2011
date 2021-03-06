require 'rails_helper'
RSpec.describe Flight, type: :model do
  before :each do
    @denver = Flight.create(number: '1221' , date:  "08/03/20", departure_city: "Los Angeles", arrival_city: "Denver")
    @boston = Flight.create(number: '3321', date:  "08/20/20", departure_city: "Denver", arrival_city: "Boston")
    @reno = Flight.create(number: '2727', date:  "08/19/20", departure_city: "Boston", arrival_city: "Reno")
    @la = Flight.create(number: '1111', date:  "08/17/20", departure_city: "Reno", arrival_city: "Los Angeles")
    @jane = @boston.passengers.create(name: "Jane", age: 12)
    @jim = @boston.passengers.create(name: "Jim", age: 18)
    @joe = @boston.passengers.create(name: "Joe", age: 27)
    @jess = @boston.passengers.create(name: "Jess", age: 30)
    @greg = @denver.passengers.create(name: "greg", age: 29)
    @haley = @denver.passengers.create(name: "haley", age: 22)
    @sue = @la.passengers.create(name: "sue", age: 24)
  end

  describe 'relationships' do
    it { should have_many :flight_passengers}
    it { should have_many(:passengers).through(:flight_passengers)}
  end

  describe 'Class methods' do
    it ':: orders by depature' do
      expect(Flight.all.order_by_departure).to eq([@reno,@boston,@denver,@la])
    end

    # it '::order_by_passenger_count' do
    #   expect(Flight.order_by_passenger_count).to eq([@reno,@boston,@denver,@la])
    # end
  end

  describe 'Instance Methods'
    it '#finds_passenger_average_age' do
      expect(@denver.find_average_passenger_age).to eq(25)
  end
end