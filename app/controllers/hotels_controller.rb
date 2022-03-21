class HotelsController < ApplicationController
  def create
    @hotel = Hotel.new(hotel_params)
    @hotel.travel = Travel.find(params[:travel_id])
    @hotel.save
    redirect_to travel_path(params[:travel_id]) + "#hotel-#{@hotel.id}"
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy
    redirect_to travel_path(@hotel.travel_id)
  end

  def update
    @hotel = Hotel.find(params[:id])
    @hotel.update(hotel_params)
    redirect_to travel_path(@hotel.travel_id) + "#hotel-#{@hotel.id}"
  end

  private

  def hotel_params
    params.require(:hotel).permit(:address, :name, :date_departure, :date_arrival, :price_per_night)
  end
end
