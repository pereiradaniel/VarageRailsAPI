require 'test_helper'
require 'json'

class UsersControllerTest < ActionController::TestCase
	test "Gets list of users" do
		get :index
		assert_response :success
		assert_equal response.content_type, 'application/vnd.api+json'
		jdata = JSON.parse response.body
		assert_equal 3, jdata['data'].length
		assert_equal jdata['data'][0]['type'], 'users'
	end

  test "Should get valid user data" do
    user = users('user_1')
    get :show, params: { id: user.id }
    assert_response :success
    jdata = JSON.parse response.body
    assert_equal user.id.to_s, jdata['data']['id']
    assert_equal user.name, jdata['data']['attributes']['name']
    assert_equal user_url(user, { host: "localhost", port: 3000 }), jdata['data']['links']['self']
  end

	test "JSON:API error block when user id is invalid" do
		get :show, params: { id: "z" }
		assert_response	404
		jdata = JSON.parse response.body
		assert_equal "Wrong ID provided", jdata['errors'][0]['detail']
		assert_equal '/data/attributes/id', jdata['errors'][0]['source']['pointer']
	end

	test "Incorrect content-type on user create throws error" do
		post :create, params: {}
		assert_response 406
	end

	test "No X-API-KEY on user create throws error" do
		@request.headers["Content-Type"] = 'application/vnd.api+json'
		post :create, params: {}
		assert_response 403
	end

	test "Invalid type in JSON data on user create throws error" do
		user = users('user_1')
		@request.headers["Content-Type"] = 'application/vnd.api+json'
		@request.headers["X-Api-Key"] = user.token
		post :create, params: { data: { type: 'posts' }}
		assert_response 409
	end

	test "Invalid data on user create throws error" do
		user = users('user_1')
		@request.headers["Content-Type"] = 'application/vnd.api+json'
		@request.headers["X-Api-Key"] = user.token
		post :create, params: {
										data: {
											type: 'users',
											attributes: {
												name: nil,
												password: nil,
												password_confirmation: nil }}}
		assert_response 422
		jdata = JSON.parse response.body
		pointers = jdata['errors'].collect { |e|
			e['source']['pointer'].split('/').last
		}.sort
		assert_equal ['name', 'password'], pointers
	end

	test "New user created if data is valid" do
		user = users('user_1')
		@request.headers["Content-Type"] = 'application/vnd.api+json'
		@request.headers["X-Api-Key"] = user.token
		post :create, params: {
										data: {
											type: 'users',
											attributes: {
												name: "TEST USER",
												password: "PASSWORD",
												password_confirmation: "PASSWORD" }}}
		assert_response 201
		jdata = JSON.parse response.body
		assert_equal 'TEST USER',
									jdata['data']['attributes']['name']
	end

	test "User is updated if data is valid" do
	user = users('user_1')
    @request.headers["Content-Type"] = 'application/vnd.api+json'
    @request.headers["X-Api-Key"] = user.token
    patch :update, params: {
                     id: user.id,
                     data: {
                       id: user.id,
                       type: 'users',
                       attributes: { name: 'User Nr1 UPDATED' }}}
    assert_response 200
    jdata = JSON.parse response.body
    assert_equal 'User Nr1 UPDATED', jdata['data']['attributes']['name']
	end

	test "Deletes user" do
		user = users('user_1')
		ucount = User.count - 1
		@request.headers["X-Api-Key"] = user.token
		delete :destroy, params: { id: users('user_2').id}
		assert_response 204
		assert_equal ucount, User.count
	end

end