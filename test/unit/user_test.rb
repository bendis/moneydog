require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "valid user" do
    user = User.new(email: "test@example.com", password: "password123", password_confirmation: "password123")
    assert user.valid?
  end

  test "invalid without email" do
    user = User.new(password: "password123", password_confirmation: "password123")
    assert_not user.valid?
    assert user.errors[:email].any?
  end

  test "invalid with duplicate email" do
    user = User.new(email: users(:one).email, password: "password123", password_confirmation: "password123")
    assert_not user.valid?
  end

  test "authenticate with correct password" do
    user = users(:one)
    assert user.authenticate("password123")
  end

  test "does not authenticate with wrong password" do
    user = users(:one)
    assert_not user.authenticate("wrongpassword")
  end

  test "password too short" do
    user = User.new(email: "new@example.com", password: "abc", password_confirmation: "abc")
    assert_not user.valid?
    assert user.errors[:password].any?
  end

  test "invalid when password confirmation does not match" do
    user = User.new(email: "new@example.com", password: "password123", password_confirmation: "different")
    assert_not user.valid?
    assert user.errors[:password_confirmation].any?
  end
end
