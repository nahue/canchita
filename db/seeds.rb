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
v = Venue.find_or_create_by!(name: "The Venue") do |v|
  v.cover.attach(
    io:  File.open(File.join(Rails.root,'app/assets/images/multi-sport-4.jpg')),
    filename: 'photo.jpg'
  )
end

a1 = Asignee.find_or_create_by!(name: "Profe de Prueba", is_coach: true)
a2 = Asignee.find_or_create_by!(name: "Profe de Prueba 2", is_coach: true)

v = Venue.find_or_create_by!(name: "Cochocho Vargas") do |v|
  v.cover.attach(
    io:  File.open(File.join(Rails.root,'app/assets/images/cochocho_vargas.jpg')),
    filename: 'photo.jpg'
  )

end
Reservation.create asignee: a1, venue: v, start_at: DateTime.now
Reservation.create asignee: a2, venue: v, start_at: DateTime.now
