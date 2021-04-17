json.(booking, :quantity_in_kg, :created_at)
json.url booking_url(booking, format: :json)
json.truck booking.truck_route.truck
json.route booking.truck_route.route