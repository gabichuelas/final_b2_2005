class Flight < ApplicationRecord
  belongs_to :airline
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers

  def airline_name
    self.airline.name
  end

  def adults
    # passengers.where('age >= ?', 18).count
    # Decided to just pull the rows, so I can get count or other info
    # from the passenger object
    passengers.where('age >= ?', 18)
  end

  def minors
    # passengers.where('age < ?', 18).count
    # Decided to just pull the rows, so I can get count or other info
    # from the passenger object
    passengers.where('age < ?', 18)
  end
end
