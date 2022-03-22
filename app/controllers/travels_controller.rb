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
    set_hotel
    set_activity
    set_transport

    marker_hotel
    marker_activity
    marker_transport

    @price_night = price_night_hotel
    @price_activity = price_activity
    @price_transport = price_transport
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

  def price_activity
    nb_activity = 0
    price_total = 0
    @activities.each do |activity|
      nb_activity += 1
      price_total += activity.price
    end
    return { nb_activity: nb_activity, price_total: price_total }
  end

  def price_transport
    nb_transport = 0
    price_total = 0
    @transports.each do |transport|
      nb_transport += 1
      price_total += transport.price
    end
    return { nb_transport: nb_transport, price_total: price_total }
  end

  def travel_params
    params.require(:travel).permit(:location)
  end

  def marker_hotel
    @markershotel = @hotels.geocoded.map do |hotel|
      {
        lat: hotel.latitude,
        lng: hotel.longitude,
        image_url: helpers.asset_url("icon-hotel.jpg")
      }
    end
  end

  def marker_activity
    @markersactivity = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        image_url: helpers.asset_url("pointer_activity.png")
      }
    end
  end

  def marker_transport
    @markerstransport = @transports.geocoded.map do |transport|
      {
        lat: transport.latitude_arrival,
        lng: transport.longitude_arrival,
        image_url: helpers.asset_url("airport_marker.webp")
      }
    end
  end

  def set_hotel
    @hotel = Hotel.new
    @hotels = Hotel.where('travel_id = ?', params[:id]).order('date_arrival ASC')
  end

  def set_activity
    @activity = Activity.new
    @activities = Activity.where('travel_id = ?', params[:id])
  end

  def set_transport
    @transport = Transport.new
    @transports = Transport.where('travel_id = ?', params[:id])
  end
end
