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
    @hotel = Hotel.new
    @hotels = Hotel.where('travel_id = ?', params[:id])

    @markershotel = @hotels.geocoded.map do |hotel|
      {
        lat: hotel.latitude,
        lng: hotel.longitude,
        image_url: helpers.asset_url("icon-hotel.jpg")
      }
    end

    @price_night = price_night_hotel
  end

  private

  def price_night_hotel
    nb_night = 0
    price_total = 0
    @hotels.each do |hotel|
      nb_night += (hotel.date_departure - hotel.date_arrival).to_i
      price_total += hotel.price_per_night * (hotel.date_departure - hotel.date_arrival).to_i
    end
    return { nb_night: nb_night, price_total: price_total }
  end

  def travel_params
    params.require(:travel).permit(:location)
  end
end
