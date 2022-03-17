class HotelsController < ApplicationController
  def create
    @hotel = Hotel.new(hotel_params)
    @hotel.travel = Travel.find(params[:travel_id])
    @hotel.save
    redirect_to travel_path(params[:travel_id])
  end

  private

  def hotel_params
    params.require(:hotel).permit(:address, :name, :date_departure, :date_arrival, :price_per_night)
  end
end
