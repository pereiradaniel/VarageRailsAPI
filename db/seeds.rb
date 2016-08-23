# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |x|
	x+=1
	User.create({
		name: "User Nr#{x}",
		password_digest: BCrypt::Password.create('password'),
		token: SecureRandom.base58(24),
  	latitude: 43.653226,
  	longitude: -79.383184,
		})
end

category_array = ["Car", "Clothing", "Electronic", "Books", "Other"]
category_array.length.times do |x|
	Category.create({
		category_name: category_array[x]
		})
end

status_array = ["Available", "Sold", "Banned"]
status_array.length.times do |x|
	Status.create({
		status_name: status_array[x]
		})
end

5.times do |x|
	x+=1
10.times do |y|
	y+=1
	Item.create({
		title: "User Nr#{x} Item Nr#{y}",
		description: "Description U#{x}/#{y}",
		price: 100.50,
		user_id: x,
		status_id: Status.find(1 + rand(status_array.length)).id
		})
	# Give the item 3 random categories
	3.times do
		Item.last.categories << Category.find(1 + rand(category_array.length))
	end
end
end