class Reservation < ApplicationRecord
  belongs_to :venue
  belongs_to :asignee
end
