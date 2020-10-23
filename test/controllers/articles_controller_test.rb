require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
	include Devise::Test::IntegrationHelpers

	# setup do 
	# 	get '/users/sign_in'
	# 	sign_in users(:user_one)
	# 	post user_session_url
	# end


	test "index page does not need authetication" do
		get articles_url
		assert_response :success
	end

	test "show page requires authentication" do
		get '/articles/15'
		assert_redirected_to '/users/sign_in'
	end

	test "new page requires authentication" do
		get '/articles/new'
		assert_redirected_to '/users/sign_in'
	end

	test "role user cant access article new page" do
		login_user(:user_guest)
		get '/articles/new'
		assert_redirected_to '/'
	end

	test "role user cant access aticle edit page" do
		login_user(:user_guest)
		get '/articles/1/edit'
		assert_redirected_to '/'
	end

	test "role editor can access article new page" do
		login_user(:user_editor)
		get '/articles/new'
		assert_response :success
	end

	test "role editor can edit their own article" do
		login_user(:user_editor)
		get '/articles/2/edit'
		assert_response :success
	end

	test "role editor can delete their own article" do
		login_user(:user_editor)
		delete '/articles/2'
		assert_redirected_to articles_path
	end

	test "role editor cant edit other editor articles" do
		login_user(:user_editor_one)
		get '/articles/2/edit'
		assert_redirected_to '/'
	end

	test "role admin can't access new article page" do
		login_user(:user_admin)
		get '/articles/new'
		assert_redirected_to '/'
	end

	test "role admin can't access edit article page" do
		login_user(:user_admin)
		get '/articles/2/edit'
		assert_redirected_to '/'
	end

	def login_user(user)
		get '/users/sign_in'
		sign_in users(user)
		post user_session_url
	end
end