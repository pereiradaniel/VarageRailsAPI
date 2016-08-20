class UserSerializer < ActiveModel::Serializer
	# Define data that is given upon request of user data
	attributes :id, :name, :created_at

	has_many :items
end