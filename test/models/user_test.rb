require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = User.new(name: "testing", email: "testing123@gmail.com", password: "123456",
  					password_confirmation: "123456")
  end
  test "should be valid" do
  	assert @user.valid?
  end
  test "name should be presence" do
  	@user.name = "   "
  	assert_not @user.valid?
  end
  test "email should be presence" do
  	@user.email = "     "
  	assert_not @user.valid?
  end
  test "name should not be too long" do
  	@user.name = "a" * 100
  	assert_not @user.valid?
  end
  test "email should not be too long" do
  	@user.email = "a" * 255 + "@gmail.com"
  	assert_not @user.valid?
  end
  test "email validation should accept valid addresses" do
  	valid_addresses = %w[test1234@gmail.com USER123@gmail.COM A_USER-test@yahoo.com 
  							first.last@foo.jp alice+bob@baz.cn]
  	valid_addresses.each do |valid_addr|
  		@user.email = valid_addr
  		assert @user.valid?
  	end
  end
  test "email validation should reject invalid addresses" do
  	invalid_addresses = %w[testuser123@gmail,com USER123_gmail.COM user.name@example.
                           test@cat_cat.com test@gmail+yahoo.com test@cat..com]
  	invalid_addresses.each do |invalid_addr|
  		@user.email = invalid_addr
  		assert_not @user.valid?
  	end
  end
  test "email should be unique" do
  	dup_user = @user.dup
  	dup_user.email = @user.email.upcase
  	@user.save
  	assert_not dup_user.valid?
  end
  test "password should not be blank (presence)" do
    @user.password = @user.password_confirmation = "    "
    assert_not @user.valid?
  end
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end
end
