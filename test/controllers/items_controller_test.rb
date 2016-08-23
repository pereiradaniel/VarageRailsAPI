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

end