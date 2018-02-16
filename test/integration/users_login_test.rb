require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = users[:testUser]
  end
  test "login with invalid information" do
  	get login_path
  	assert_template 'sessions/new'
  	post login_path, params: {session: {email: "", password: ""}}
  	assert_template root_path
  	assert_not flash.empty?
  	get root_path
  	assert flash.empty?
  end
  test "Login with valid information" do
  	get login_path
  	assert_template 'sessions/new'
  	post login_path, params: {session: {email: @user.email, password: "123456"}}
  	assert_redirected_to root_path
  	assert_template 'static_pages/home'
  	assert_not flash.empty?
  	get root_path
  	assert flash.empty?
  end
end