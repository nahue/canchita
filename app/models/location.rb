class Location < ApplicationRecord
  has_one_attached :cover
  has_many :bookings
end
