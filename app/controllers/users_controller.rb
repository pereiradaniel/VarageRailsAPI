class UsersController < ApplicationController
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
end