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
def setup_initial_user
  User.create :name => 'John Doe', :email => 'john@gmail.com', :password => '123demo123', :password_confirmation => '123demo123'
end

user = setup_initial_user

v1 = Venue.create! name: "The Venue"
v1.cover.attach(
  io:  File.open(File.join(Rails.root,'app/assets/images/multi-sport-4.jpg')),
  filename: 'venue1.jpg'
)

a1 = Asignee.create! name: "Profe de Prueba", is_coach: true
a2 = Asignee.create! name: "Profe de Prueba 2", is_coach: true

v2 = Venue.create! name: "Cochocho Vargas"
v2.cover.attach(
  io:  File.open(File.join(Rails.root,'app/assets/images/cochocho_vargas.jpg')),
  filename: 'cochocho_vargas.jpg'
)


r = Reservation.new
r.asignee_id = a1.id
r.venue_id = v1.id
r.start_at = DateTime.now
r.save

Reservation.create! asignee: a2, venue: v2, start_at: DateTime.now
