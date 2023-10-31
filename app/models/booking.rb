class Booking < ApplicationRecord
  belongs_to :location
  belongs_to :asignee
end
