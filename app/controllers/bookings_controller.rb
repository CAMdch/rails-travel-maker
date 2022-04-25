class BookingsController < ApplicationController
  def new
    @booking = Booking.new(travel_id: params[:travel_id])
    render_value

    @users = User.all
    user_exist = false

    @users.each do |user|
      user_exist = true if user.email == params[:query]
    end

    render "travels/show" unless user_exist


    if @booking.save
      redirect_to travel_path(@travel.id)
    end
  end

  def render_value
    @travel = Travel.find_by('id = ?', params[:travel_id])
    @hotel = Hotel.new
    @hotels = Hotel.all
    @activity = Activity.new
    @activities = Activity.all
    @transport = Transport.new
    @transports = Transport.all
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
end
