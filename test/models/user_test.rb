require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup 
  	@user = User.new(name: "Example name", email: "user@example.com")
  end

  test "should be valid" do
  	assert @user.valid?
  end

  test "name should be present" do
  	@user.name = ""
  	assert_not @user.valid?
  end

  test "email should be present" do
  	@user.email = ""
  	assert_not @user.valid?
  end

  test "name should not exceed 50 characters" do
  	@user.name = 'a'*51
  	assert_not @user.valid?
  end

  test "email should not exceed 255 characters" do
  	@user.name = 'a'*244 + '@example.com'
  	assert_not @user.valid?
  end

  test "emails should be format correct" do
  	valid_emails = %w[user@example.com USER@foo.COM A_US-ER@foo.org first.last@foo.jp 
  		                                               alice+bob@baz.cn pope@mail23.com]
  	valid_emails.each do |email|
  		@user.email = email
  		assert @user.valid?, "#{email.inspect} should be valid"
  	end
  end

  test "wrong emails should not be format correct" do
  	valid_emails = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com peep@mail.2mm peep@mail.m2m]
  	valid_emails.each do |email|
  		@user.email = email
  		assert_not @user.valid?, "#{email.inspect} should not be valid"
  	end
  end

end
