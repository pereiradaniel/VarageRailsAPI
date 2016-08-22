require 'test_helper'
require 'json'

class ItemsControllerTest < ActionController::TestCase

	test "Gets list of valid items" do
		get :index
		assert_response :success
		jdata = JSON.parse response.body
		assert_equal Item.count, jdata['data'].length
		assert_equal jdata['data'][0]['type'], 'items'
	end
end