class Transport < ApplicationRecord
  geocoded_by :address_departure, latitude: :latitude_depart, longitude: :longitude_depart
  after_validation :geocode, if: :will_save_change_to_address_departure?

  geocoded_by :address_arrival,latitude: :latitude_arrival, longitude: :longitude_arrival
  after_validation :geocode, if: :will_save_change_to_address_arrival?

  belongs_to :travel
end
