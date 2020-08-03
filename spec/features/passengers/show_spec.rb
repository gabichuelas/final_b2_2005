# Passengers#show_spec

RSpec.describe 'As a visitor' do

  before :each do
    @frontier = Airline.create(name: 'Frontier')
    @flight1 = @frontier.flights.create(number: '1727', date: '08/03/20', time: '7:00 PM MT', departure: 'Denver', arrival: 'Reno')
    @flight2 = @frontier.flights.create(number: '7777', date: '10/05/20', time: '4:00 PM EST', departure: 'Orlando', arrival: 'Denver')
    @flight3 = @frontier.flights.create(number: '7272', date: '10/10/20', time: '3:00 PM MT', departure: 'Denver', arrival: 'Orlando')

    @gaby = Passenger.create(name: 'Gaby', age: 30)

    FlightPassenger.create(flight_id: @flight1.id, passenger_id: @gaby.id)
    FlightPassenger.create(flight_id: @flight2.id, passenger_id: @gaby.id)
    FlightPassenger.create(flight_id: @flight3.id, passenger_id: @gaby.id)
  end

  describe 'When I visit a passengers show page' do
    it 'I see that passengers name, and I see a section of the page that displays all flight numbers of the flights for that passenger' do
      #
      visit "/passengers/#{@gaby.id}"

      expect(page).to have_content('Gaby')
      expect(page).to have_content('1727')
      expect(page).to have_content('7777')
      expect(page).to have_content('7272')
    end

    it 'All flight numbers are links to that flight’s show page' do
      #
      visit "/passengers/#{@gaby.id}"

      expect(page).to have_link('1727')
      expect(page).to have_link('7777')
      expect(page).to have_link('7272')

      click_on '7777'
      expect(current_path).to eq("/flights/#{@flight2.id}")
    end
  end
end
