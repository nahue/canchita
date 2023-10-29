class Reservation < ApplicationRecord
  belongs_to :location
  belongs_to :asignee
end
