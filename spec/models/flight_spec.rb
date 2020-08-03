RSpec.describe Flight do
  describe 'relationships' do
    it { should belong_to :airline }
    it { should have_many :flight_passengers }
    it { should have_many(:passengers).through(:flight_passengers)}
  end

  describe 'instance methods' do
    it '#airline_name' do
      frontier = Airline.create!(name: 'Frontier')
      flight1 = frontier.flights.create!(number: '1727', date: '08/03/20', time: '7:00 PM EST', departure: 'Denver', arrival: 'Reno', airline_id: frontier.id)

      expect(flight1.airline_name).to eq('Frontier')
    end
  end
end
