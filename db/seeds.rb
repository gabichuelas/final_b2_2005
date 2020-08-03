# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@frontier = Airline.create(name: 'Frontier')
@jetblue = Airline.create(name: 'JetBlue')

@flight1 = @frontier.flights.create(number: '1727', date: '08/03/20', time: '7:00 PM MT', departure: 'Denver', arrival: 'Reno')
@flight2 = @frontier.flights.create(number: '7777', date: '10/05/20', time: '4:00 PM EST', departure: 'Orlando', arrival: 'Denver')
@flight3 = @frontier.flights.create(number: '7272', date: '10/10/20', time: '3:00 PM MT', departure: 'Denver', arrival: 'Orlando')

@flight4 = @jetblue.flights.create(number: '1234', date: '11/22/20', time: '5:00 PM EST', departure: 'Orlando', arrival: 'Santo Domingo')

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
