json.routes @routes do |route|
  json.origin route.origin, :code, :name
  json.destination route.destination, :code, :name
  json.trucks route.truck_routes do |truck_route|
  	json.date truck_route.start_date
  	json.name truck_route.truck.name
  	json.plate_no truck_route.truck.plate_no
  	json.capacity_in_kg truck_route.truck.capacity_in_kg
  end
end