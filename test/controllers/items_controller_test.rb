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

  test "Should get valid item data" do
    item = items('item_1_2')
    get :show, params: { id: item.id }
    assert_response :success
    jdata = JSON.parse response.body
    assert_equal item.id.to_s, jdata['data']['id']
    assert_equal item.title, jdata['data']['attributes']['title']
  end

	test "JSON:API error block when item id is invalid" do
		get :show, params: { id: "z" }
		assert_response	404
		jdata = JSON.parse response.body
		assert_equal "Wrong ID provided", jdata['errors'][0]['detail']
		assert_equal '/data/attributes/id', jdata['errors'][0]['source']['pointer']
	end

	test "Incorrect content-type on item create throws error" do
		post :create, params: {}
		assert_response 406
	end

	test "No X-API-KEY on item create throws error" do
		@request.headers["Content-Type"] = 'application/vnd.api+json'
		post :create, params: {}
		assert_response 403
	end


end