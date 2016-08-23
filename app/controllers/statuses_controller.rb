class StatusesController < ApplicationController
	before_action :set_status, only: [:show, :update, :destroy]
	
	def index
		statuses = Status.all
		render json: statuses
	end

	def show
		render json: @status
	end

	private
	def set_status
		begin
			@status = Status.find params[:id]
		rescue ActiveRecord::RecordNotFound
			status = Status.new
			status.errors.add(:id, "Wrong ID provided")
			render_error(status, 404) and return
		end
	end
end