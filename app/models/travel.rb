class Travel < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :location, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  has_many :hotels, dependent: :destroy
  has_many :transports, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  def nb_day
    (self.end_date - self.start_date).to_i
  end

  def total_price
    price_hotel = 0
    price_transport = 0
    pirce_activity = 0
    self.hotels.each do |hotel|
      price_hotel += (hotel.date_departure - hotel.date_arrival).to_i * hotel.price_per_night
    end
    self.transports.each do |transport|
      price_transport += transport.price
    end
    self.activities.each do |activity|
      pirce_activity += activity.price
    end
    return price_hotel + price_transport + pirce_activity
  end
end
