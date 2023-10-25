class Asignee < ApplicationRecord
  has_many :reservations
  has_many :venues, :through => :reservations
end
