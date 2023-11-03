class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :location

  attr_accessor :hours
end
