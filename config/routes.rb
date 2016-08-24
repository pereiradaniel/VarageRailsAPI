Rails.application.routes.draw do
	# Routes for NEW and EDIT not created because this is an --api app!
	resources :users
	resources :items
	get '/items/:user_id/:status_id', to: 'items#show_with_status_by_user', as: 'show_with_status_by_user'
	get '/itemsbycategory/:category_id', to: 'items#show_items_in_a_category', as: 'show_items_in_a_category'
	resources :statuses
end
