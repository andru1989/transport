# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seeds for vehicles

Vehicle.destroy_all
Passenger.destroy_all
Travel.destroy_all

# Seeds for vehicles
vehicles = [
  { color: 'white', model: '2015', licence_plate: 'ABC234' },
  { color: 'red', model: '2013', licence_plate: 'ABC564' },
  { color: 'black', model: '2016', licence_plate: 'DFG564' },
  { color: 'white', model: '2011', licence_plate: 'DFG872' }
]

persisted_vehicles = vehicles.map do |vehicle|
  vehicle = Vehicle.new(vehicle)
  Vehicles::LicencePlateParser.call(vehicle)
  vehicle.save!
  vehicle
end

puts "Vehicles created"

# Seeds for passengers
passengers = [
  { name: 'Andres' }, { name: 'Cristian' }, { name: 'Camilo' }, { name: 'Juan' }
]

persisted_passengers = passengers.map do |passenger|
  passenger = Passenger.new(passenger)
  passenger.save!
  passenger
end
puts "Passengers created"

# Seeds for travels
travels = [
  { origin: 'Medellín', destination: 'Envigado' },
  { origin: 'Medellín', destination: 'Sabaneta' },
  { origin: 'Sabaneta', destination: 'Robledo' },
  { origin: 'Envigado', destination: 'La estrella' }
]

travels.each_with_index do |hash, index|
  travel = Travel.new(hash).tap do |tr|
    tr.vehicle    = persisted_vehicles[index]
    tr.passenger  = persisted_passengers[index]
  end
  travel.save!
end

puts "Travels created"
