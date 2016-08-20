class User < ApplicationRecord
	has_secure_token
	has_secure_password

	validates :name, presence: true
end