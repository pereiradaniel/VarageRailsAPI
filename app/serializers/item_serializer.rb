class ItemSerializer < ActiveModel::Serializer
	attributes :id, :title, :description, :created_at
	belongs_to :user
  has_many :categories
	has_many :statuses
	link(:self) { user_url(object) }
end