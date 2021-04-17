class BookingsController < ApplicationController
  before_action :authenticate_user
  before_action :set_booking, only: %i[ show update destroy ]

  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.where(user: current_user).limit(20)
    render json: @bookings.to_json
  end

  # GET /bookings/1 or /bookings/1.json
  def show
    puts("test")
  end

  # POST /bookings or /bookings.json
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user

    if @booking.save      
      # render :show 
       render json: @booking.to_json
    else
      render json: { errors: @booking.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    if @booking.update(booking_params)
      render :show 
    else
      render json: { errors: @booking.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.permit(:quantity_in_kg, :truck_route_id)
    end
end
