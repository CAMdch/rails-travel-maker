class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :travel

  validates :user_id, presence: true
end
