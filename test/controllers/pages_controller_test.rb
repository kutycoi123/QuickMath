require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test 'Should get root page' do
  	get root_path
  	assert_response :success
  end
  test "should get welcome page" do
  	get welcome_path
  	assert_response :success
  end
  test "should get about page" do
  	get about_path
  	assert_response :success
  end
end