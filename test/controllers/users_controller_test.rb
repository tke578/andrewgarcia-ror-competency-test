require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
	include Devise::Test::IntegrationHelpers


	test "role user can't access user index page " do
		login_user(:user_guest)
		get '/users_admin'
		assert_redirected_to '/'
	end

	test "role user can't access user new page " do
		login_user(:user_guest)
		get '/users_admin/new'
		assert_redirected_to '/'
	end

	test "role user can't access user edit page " do
		login_user(:user_guest)
		get '/users_admin/1/edit'
		assert_redirected_to '/'
	end

	test "role editor can't access user index page " do
		login_user(:user_editor)
		get '/users_admin'
		assert_redirected_to '/'
	end

	test "role editor can't access user new page " do
		login_user(:user_editor)
		get '/users_admin/new'
		assert_redirected_to '/'
	end

	test "role editor can't access user edit page " do
		login_user(:user_editor)
		get '/users_admin/1/edit'
		assert_redirected_to '/'
	end

	test "role admin can access user index page " do
		login_user(:user_admin)
		get '/users_admin'
		assert_response :success
	end

	test "role admin can access user new page " do
		login_user(:user_admin)
		get '/users_admin/new'
		assert_response :success
	end

	test "role admin can access user edit page " do
		login_user(:user_admin)
		get '/users_admin/1/edit'
		assert_response :success
	end



	def login_user(user)
		get '/users/sign_in'
		sign_in users(user)
		post user_session_url
	end


end