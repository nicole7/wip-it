# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




User.destroy_all

# 25.times do
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#   email = "#{last_name}" + "." + "#{first_name}@gmail.com"
#   password = "12345"
#   User.create!(first_name: first_name, last_name: last_name, email: email, password: password)
# end

User.create!(first_name: "Nicole", last_name: "Gasperini", email: "gasperini@gmail.com", password: "12345")

# users = User.first(10)
# user = User.find_by(first_name: "Nicole")
# users << user

# users = User.take(10)
# users.each {|friend| user.friends << friend}