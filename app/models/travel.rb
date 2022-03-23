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
end
