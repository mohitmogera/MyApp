# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

location_mapping = {
    MUM: 'Mumbai',
    DEL: 'Delhi',
    HYD: 'Hyderabad',
    BLR: 'Bangalore',
    CHN: 'Chennai',
    KKT: 'Kolkata',
    PUN: 'Pune'
  }
  
  truck_capacities = [10000.0, 5000.0, 2500.000, 7500.000]
  
  
  locations = Location.create(location_mapping.map{|k,v| {code: k.to_s, name: v} })
  routes = Route.create(locations.combination(2).map{|c| {origin: c[0], destination: c[1]} })
  
  
  # Add atleast one truck on every route 
  routes.each_with_index do |route, i|
    ('A'...'E').each do |variation|
      truck = Truck.create(name: "Truck #{i}#{variation}", plate_no: "MH 01 #{variation} #{"%04d" % i}", capacity_in_kg: truck_capacities.sample)
      TruckRoute.create(truck: truck, route: route, start_date: Time.zone.now + rand(20).days)
    end  
  end
  
  
  
  
  