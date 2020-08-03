RSpec.describe Airline do
  describe 'validations' do
    it { should have_many :flights }
  end
end
