require 'rails_helper'
describe 'flight show page' do
  before :each do
    @denver = Flight.create(number: '1221' , date:  "08/03/20", departure_city: "Los Angeles", arrival_city: "Denver")
    @boston = Flight.create(number: '3321', date:  "08/20/20", departure_city: "Denver", arrival_city: "Boston")
    @reno = Flight.create(number: '2727', date:  "08/19/20", departure_city: "Boston", arrival_city: "Reno")
    @la = Flight.create(number: '1111', date:  "08/17/20", departure_city: "Reno", arrival_city: "Los Angeles")
    @jane = @denver.passengers.create(name: "Jane", age: 12)
    @jim = @denver.passengers.create(name: "Jim", age: 18)
    @joe = @denver.passengers.create(name: "Joe", age: 27)
    @jess = @denver.passengers.create(name: "Jess", age: 30)
  end

  it 'shows a flights attributes and all passengers on that flight' do
    visit flight_path(@denver)

    expect(page).to have_content(@denver.number)
    expect(page).to have_content(@denver.date)
    expect(page).to have_content(@denver.departure_city)
    expect(page).to have_content(@jim.name)
    expect(page).to have_content(@jess.name)
    expect(page).to have_content(@joe.name)
    expect(page).to_not have_content(@jane.name)
  end

  it 'Shows average age of passengers' do
    visit flight_path(@denver)

    expect(page).to have_content("Average Age of Passengers: 21")
  end
end