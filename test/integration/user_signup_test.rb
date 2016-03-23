require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "wrong signup does not create user" do
  	get signup_path
  	before = User.count
  	post users_path, user: { name: "Pepe perez", 
  								email: "mail@mail.com",
  								password: "foo",
  								password_confirmation: "foo"
  							}
  	after = User.count
  	assert_equal before, after
  	assert_template "users/new"
    assert_select "div#error_container"
  end
end
