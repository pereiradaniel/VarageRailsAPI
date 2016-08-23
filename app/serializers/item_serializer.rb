class ItemSerializer < ActiveModel::Serializer
	attributes :id, :title, :description, :created_at
	belongs_to :user
  has_many :categories
	link(:self) { user_url(object) }
	# belongs_to :status
end