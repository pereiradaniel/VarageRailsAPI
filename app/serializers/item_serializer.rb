class ItemSerializer < ActiveModel::Serializer
	attributes :id, :title, :description, :created_at
	belongs_to :user
	# has_and_belongs_to_many :categories
	# belongs_to :status
end