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

  private

  def travel_params
    params.require(:travel).permit(:location)
  end
end
