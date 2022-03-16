class Travel < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :location, presence: true

  has_many :hotels
  has_many :transports
  has_many :activities
  has_many :favorites
  has_many :bookings
end
