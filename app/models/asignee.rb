# frozen_string_literal: true
class Asignee < ApplicationRecord
  has_many :bookings
  has_many :locations, through: :bookings
end
