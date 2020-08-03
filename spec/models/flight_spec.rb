RSpec.describe Flight do
  describe 'relationships' do
    it { should belong_to :airline }
    it { should have_many :flight_passengers }
    it { should have_many(:passengers).through(:flight_passengers)}
  end

  describe 'instance methods' do
    before :each do
      @frontier = Airline.create!(name: 'Frontier')
      @flight1 = @frontier.flights.create!(number: '1727', date: '08/03/20', time: '7:00 PM EST', departure: 'Denver', arrival: 'Reno', airline_id: @frontier.id)

      # test if you can do flight.passengers.create
      @gaby = Passenger.create(name: 'Gaby', age: 30)
      @robin = Passenger.create(name: 'Robin', age: 37)
      @ruthie = Passenger.create(name: 'Ruthie', age: 27)
      @child = Passenger.create(name: 'Strange Child', age: 12)
      @young_adult = Passenger.create(name: 'I\'m Legal', age: 18)

      FlightPassenger.create(flight_id: @flight1.id, passenger_id: @gaby.id)
      FlightPassenger.create(flight_id: @flight1.id, passenger_id: @robin.id)
      FlightPassenger.create(flight_id: @flight1.id, passenger_id: @ruthie.id)
      FlightPassenger.create(flight_id: @flight1.id, passenger_id: @child.id)
      FlightPassenger.create(flight_id: @flight1.id, passenger_id: @young_adult.id)
    end

    it '#airline_name' do
      expect(@flight1.airline_name).to eq('Frontier')
    end

    it '#adults' do
      expect(@flight1.adults).to eq([@gaby, @robin, @ruthie, @young_adult])
    end

    it '#minors' do
      expect(@flight1.minors).to eq([@child])
    end
  end
end
