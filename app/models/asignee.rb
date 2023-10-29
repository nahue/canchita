class Asignee < ApplicationRecord
  has_many :reservations
  has_many :locations, :through => :reservations
end
