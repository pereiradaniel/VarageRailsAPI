class ItemsController < ApplicationController
	before_action :set_item, only: [:show, :update, :destroy]
	before_action :validate_item, only: [:create, :update, :destroy]
	before_action :validate_type, only: [:create, :update]

	def create
		item = Item.new(item_params)
		if item.save
			render json: item, status: :created
		else
			render_error(item, :unprocessable_entity)
		end
	end

	def index
		items = Item.all
		render json: items
	end

	def show
		render json: @item
	end

	def show_with_status_by_user
		get_items_with_status_by_user
		render json: @items
	end

	private
	def set_item
		begin
			# Detect if item is banned
			item = Item.find params[:id]
			if item.status_id != 3
				@item = item
			end
		rescue ActiveRecord::RecordNotFound
			item = Item.new
			item.errors.add(:id, "Wrong ID provided")
			render_error(item, 404) and return
		end
	end

	def get_items_with_status_by_user
		# Detects if status = "banned", returns null
		if params[:status_id] != "3"
			@items = Item.where("user_id = ? AND status_id = ?", params[:user_id], params[:status_id])
		else
		end
	end

  def item_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end