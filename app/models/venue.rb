class Venue < ApplicationRecord
  has_one_attached :cover
  has_many :reservations
  has_many :asignees, :through => :reservations
end
