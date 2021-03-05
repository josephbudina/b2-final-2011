require 'rails_helper'
describe 'flight index page' do
  before :each do
    @denver = Flight.create(number: '1221' , date:  "08/03/20", departure_city: "Los Angeles", arrival_city: "Denver")
    @boston = Flight.create(number: '3321', date:  "08/20/20", departure_city: "Denver", arrival_city: "Boston")
    @reno = Flight.create(number: '2727', date:  "08/19/20", departure_city: "Boston", arrival_city: "Reno")
    @la = Flight.create(number: '1111', date:  "08/17/20", departure_city: "Reno", arrival_city: "Los Angeles")
  end

  it 'shows each flight with attributes ordered by departure city' do
    visit flights_path

    expect("Departure city: Boston").to appear_before("Departure city: Denver")
    expect("Departure city: Denver").to appear_before("Departure city: Los Angeles")
    expect("Departure city: Los Angeles").to appear_before("Departure city: Reno")
    expect(page).to have_content("1221")
    expect(page).to have_content("08/03/20")
  end
end