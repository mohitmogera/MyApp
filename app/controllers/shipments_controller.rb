class ShipmentsController < ApplicationController
  def search
    puts("oorign")
    puts(params.fetch(:origin))
  	origin = Location.where(code: params.fetch(:origin)).first
  	destination = Location.where(code: params.fetch(:destination)).first
  	start_date = params.fetch(:start_date, Time.zone.now).to_date
    capacity_in_kg = params.fetch(:capacity_in_kg)
    puts("startdate")
    puts(origin)
    @routes = Route.includes(:origin, :destination, :trucks)         
      .where(origin: origin, destination: destination)
      .select("trucks.name,trucks.capacity_in_kg,truck_routes.start_date,routes.origin_id,routes.destination_id") 
      .joins(:truck_routes).where(truck_routes: {start_date: start_date..(start_date + 365.days) } )
      .joins(:trucks).where("trucks.id = truck_routes.truck_id and trucks.capacity_in_kg >?",capacity_in_kg)
      puts(@routes)
      render json: @routes.to_json
  end
end
