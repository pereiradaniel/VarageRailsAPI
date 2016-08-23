class ItemSerializer < ActiveModel::Serializer
	attributes :id, :title, :description, :status_id, :created_at
	belongs_to :user
  has_many :categories
	belongs_to :status
	link(:self) { item_url(object) }
end