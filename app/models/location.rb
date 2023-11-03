class Location < ApplicationRecord
  belongs_to :owner_user, class_name: 'User'
  has_one_attached :cover
  has_many :bookings

  def taken?(start_time, end_time)
    Booking.where(location_id: id)
           .where('(start_at <= ? AND end_at >= ?) OR (start_at <= ? AND end_at >= ?) OR (start_at >= ? AND end_at <= ?)',
                  start_time, start_time, end_time, end_time, start_time, end_time)
           .exists?
  end
end
