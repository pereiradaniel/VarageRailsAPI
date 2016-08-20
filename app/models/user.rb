class User < ApplicationRecord
	has_many :items, dependent: :destroy

	has_secure_token
	has_secure_password

	validates :name, presence: true
end