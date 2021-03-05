require 'rails_helper'
RSpec.describe Flight, type: :model do
  before :each do
    @denver = Flight.create(number: '1221' , date:  "08/03/20", departure_city: "Los Angeles", arrival_city: "Denver")
    @boston = Flight.create(number: '3321', date:  "08/20/20", departure_city: "Denver", arrival_city: "Boston")
    @reno = Flight.create(number: '2727', date:  "08/19/20", departure_city: "Boston", arrival_city: "Reno")
    @la = Flight.create(number: '1111', date:  "08/17/20", departure_city: "Reno", arrival_city: "Los Angeles")
  end

  describe 'relationships' do
    it { should have_many :flight_passengers}
    it { should have_many(:passengers).through(:flight_passengers)}
  end

  describe 'Class methods' do
    it ':: orders by depature' do
      expect(Flight.all.order_by_departure).to eq([@reno,@boston,@denver,@la])
    end
  end
end