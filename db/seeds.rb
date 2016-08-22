# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |x|
	User.create({
		name: "User Nr#{x}",
		password_digest: BCrypt::Password.create('password'),
		token: SecureRandom.base58(24),
  	latitude: 43.653226,
  	longitude: -79.383184,
		})
end

5.times do |x|
10.times do |y|
	Item.create({
		title: "User Nr#{x} Item Nr#{y}",
		description: "Description U#{x}/#{y}",
		price: 100.50,
		user_id: x
		})
end
end