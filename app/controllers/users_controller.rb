class UsersController < ApplicationController
	before_action :validate_user, only: [:create, :update, :destroy]
	before_action :validate_type, only: [:create, :update]

	def create
		user = User.new(user_params)
		if user.save
			render json: user, status: :created
		else
			render_error(user, :unprocessable_entity)
		end
	end

	def index
		users = User.all
		render json: users
	end

	def show
		render json: @user
	end

	private
	def set_user
		begin
			@user = User.find params[:id]
		rescue ActiveRecord::RecordNotFound
			user = User.new
			user.errors.add(:id, "Wrong ID provided")
			render_error(user, 404) and return
		end
	end

	def user_params
		ActiveModelSerializers::Deserialization.jsonapi_parse(params)
	end
end