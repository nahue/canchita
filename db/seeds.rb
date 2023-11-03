# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#

user = User.create name: 'John Doe', email: 'john@gmail.com', password: '123demo123', password_confirmation: '123demo123'

location1 = Location.create! name: 'The Location', owner_user: user
location1.cover.attach(
  io: File.open(File.join(Rails.root, 'app/assets/images/multi-sport-4.jpg')),
  filename: 'location1.jpg'
)

location2 = Location.create! name: 'Cochocho Vargas', owner_user: user
location2.cover.attach(
  io: File.open(File.join(Rails.root, 'app/assets/images/cochocho_vargas.jpg')),
  filename: 'cochocho_vargas.jpg'
)

Booking.create!(user:, location: location1, start_at: DateTime.now, end_at: DateTime.tomorrow)
Booking.create!(user:, location: location2, start_at: DateTime.now, end_at: DateTime.tomorrow)
