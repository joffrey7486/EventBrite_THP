require 'faker'

nb_users = 50
nb_events = 10
nb_attendances = 200

Faker::Config.locale = 'fr'

puts "Purge de la base de données..."

User.destroy_all
Event.destroy_all
Attendance.destroy_all

puts "Début de l'insémination..."

# Ajout de n User à la base de données
nb_users.times do |i|
  first_name = Faker::Games::Pokemon.name
  last_name = Faker::Games::SuperMario.character
  User.create(
    first_name: first_name,
    last_name: last_name,
    description: Faker::Hacker.say_something_smart ,
    email: first_name + last_name.downcase + "@yopmail.com",
    password: first_name + last_name
    )
end

puts "#{User.all.count} users sont en base de données"

# Ajout de n Events à la base de données
nb_events.times do
  event = Event.create(
  start_date: Faker::Time.forward,
  title: Faker::Lorem.paragraph_by_chars(number: 15).chop,
  description: Faker::Lorem.sentence(word_count: 50+ rand(10)),
  duration: rand(1..100) * 5,
  price: rand(10..100),
  location: Faker::JapaneseMedia::Naruto.village,
  admin: User.all.sample
  )
end
puts "#{Event.all.count} évènements sont en base de données"

nb_attendances.times do
  Attendance.create!(
    stripe_customer_id: Faker::Code.imei,
    user: User.all.sample,
    event: Event.all.sample
  )
end

puts "#{Attendance.all.count} participations sont en base de données"


puts "Fin du seed."
