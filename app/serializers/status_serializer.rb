class StatusSerializer < ActiveModel::Serializer
	attributes :id, :status_name
	has_many :items
	link(:self) { status_url(object) }
end