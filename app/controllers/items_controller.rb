class ItemsController < ApplicationController
	before_action :set_item, only: [:show, :update, :destroy]

	def index
		items = Item.all
		render json: items
	end

	def show
		render json: @item
	end

	private
	def set_item
		begin
			@item = Item.find params[:id]
		rescue ActiveRecord::RecordNotFound
			item = Item.new
			item.errors.add(:id, "Wrong ID provided")
			render_error(user, 404) and return
		end
	end
  def item_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end