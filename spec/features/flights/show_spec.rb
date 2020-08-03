# flights#show_spec

RSpec.describe 'As a visitor' do

  before :each do
    @frontier = Airline.create(name: 'Frontier')
    @flight1 = @frontier.flights.create(number: '1727', date: '08/03/20', time: '7:00 PM MT', departure: 'Denver', arrival: 'Reno')

    @gaby = Passenger.create(name: 'Gaby', age: 30)
    @robin = Passenger.create(name: 'Robin', age: 37)
    @ruthie = Passenger.create(name: 'Ruthie', age: 27)

    @young_adult = Passenger.create(name: 'I\'m Legal', age: 18)


    FlightPassenger.create(flight_id: @flight1.id, passenger_id: @gaby.id)
    FlightPassenger.create(flight_id: @flight1.id, passenger_id: @robin.id)
    FlightPassenger.create(flight_id: @flight1.id, passenger_id: @ruthie.id)

    FlightPassenger.create(flight_id: @flight1.id, passenger_id: @young_adult.id)
  end

  describe 'When I visit a flights show page' do
    it 'I see all of that flights information including:
    - number
    - date
    - time
    - departure city
    - arrival city' do
      #
      visit "/flights/#{@flight1.id}"

      expect(page).to have_content('1727')
      expect(page).to have_content('Date: 08/03/20')
      expect(page).to have_content('Departure: Denver')
      expect(page).to have_content('Time: 7:00 PM MT')
      expect(page).to have_content('Arrival: Reno')
    end

    it 'And I see the name of the airline this flight belongs to' do
      #
      visit "/flights/#{@flight1.id}"
      expect(page).to have_content('Frontier')
    end

    it 'And I see the names of all of the passengers on this flight' do
      #
      visit "/flights/#{@flight1.id}"
      expect(page).to have_content('Gaby')
      expect(page).to have_content('Robin')
      expect(page).to have_content('Ruthie')
      expect(page).to have_content('I\'m Legal')
    end

    it 'I see the number of minors on the flight (minors are any passengers that are under 18)' do
      child = Passenger.create(name: 'Strange Child', age: 12)
      FlightPassenger.create(flight_id: @flight1.id, passenger_id: child.id)
      #
      visit "/flights/#{@flight1.id}"
      expect(page).to have_content('Minors: 1')
    end

    it 'And I see the number of adults on the flight (adults are any passengers that are 18 or older)' do
      #
      visit "/flights/#{@flight1.id}"
      expect(page).to have_content('Adult Passengers: 4')
    end
  end
end
