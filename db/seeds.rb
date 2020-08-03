# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@frontier = Airline.create(name: 'Frontier')
@flight1 = @frontier.flights.create(number: '1727', date: '08/03/20', time: '7:00 PM EST', departure_city: 'Denver', arrival_city: 'Reno')

@gaby = Passenger.create(name: 'Gaby', age: 30)
@robin = Passenger.create(name: 'Robin', age: 37)
@ruthie = Passenger.create(name: 'Ruthie', age: 27)
@child = Passenger.create(name: 'Strange Child', age: 12)

FlightPassenger.create(flight_id: @flight1.id, passenger_id: @gaby.id)
FlightPassenger.create(flight_id: @flight1.id, passenger_id: @robin.id)
FlightPassenger.create(flight_id: @flight1.id, passenger_id: @ruthie.id)
FlightPassenger.create(flight_id: @flight1.id, passenger_id: @child.id)
