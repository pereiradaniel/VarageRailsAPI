require 'test_helper'
require 'json'

class UsersControllerTest < ActionController::TestCase
	test "Gets list of users" do
		get :index
		assert_response :success
		assert_equal response.content_type, 'application/vnd.api+json'		
		jdata = JSON.parse.response.body
		assert_equal 3, jdata['data'].length
		assert_equal jdata['data'][0]['type'], 'users'
	end

	test "Gets user data" do
		user = users('user_1')
		get :show, params: { id: user.id }
		assert_response :success
		jdata = JSON.parse response.body
		assert_equal user.id.to_s, jdata['data']['id']
		assert_equal user.name, jdata['data']['attributes']['name']
		assert_equal user_url(user, {host: "localhost", port: 3000}),
			jdata['data']['links']['self']
	end

	test "JSON:API error block when user id is invalid" do
		get :show, params: { id: "z" }
		assert_response	404
		jdata = JSON.parse response.body
		assert_equal "INVALID ID", jdata['errors'][0]['detail']
		assert_equal '/data/attributes/id', jdata['errors'][0]['source']['pointer']
	end

end