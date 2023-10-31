class Location < ApplicationRecord
  has_one_attached :cover
  has_many :bookings
  has_many :asignees, through: :bookings
end
