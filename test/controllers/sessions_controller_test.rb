require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  	test "should get new" do
  		get login_path
  		assert_response :success
	end
<<<<<<< HEAD
end
=======
end
>>>>>>> 721266809624b699f5477df52229865e1f0e8966
