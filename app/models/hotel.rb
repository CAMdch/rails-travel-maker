class Hotel < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :travel

  validates :address, presence: true
  validates :name, presence: true
  validates :date_departure, presence: true
  validates :date_arrival, presence: true
  validates :price_per_night, presence: true
end
