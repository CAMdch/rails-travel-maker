class TravelsController < ApplicationController
  def new
    @travel = Travel.new
  end

  def create
    @travel = Travel.new(travel_params)
    @travel.save
    @booking = Booking.new(user_id: current_user.id, travel_id: @travel.id)
    @booking.save
    redirect_to travel_path(@travel.id)
  end

  def show
    @travel = Travel.find(params[:id])
    @booking = Booking.find_by('travel_id = ?', params[:id])
    @marker = [{ lat: @travel.latitude, lng: @travel.longitude }]
    @hotel = Hotel.new
  end

  private

  def travel_params
    params.require(:travel).permit(:location)
  end
end
