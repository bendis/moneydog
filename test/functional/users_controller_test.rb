require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new registration page" do
    get new_user_url
    assert_response :success
  end

  test "should create user with valid data" do
    assert_difference("User.count") do
      post users_url, params: { user: {
        email: "newuser@example.com",
        password: "password123",
        password_confirmation: "password123"
      } }
    end
    assert_redirected_to account_url
  end

  test "should not create user with invalid data" do
    assert_no_difference("User.count") do
      post users_url, params: { user: { email: "", password: "pass", password_confirmation: "pass" } }
    end
    assert_response :unprocessable_entity
  end

  test "should show account" do
    post user_session_url, params: { email: users(:one).email, password: "password123" }
    get account_url
    assert_response :success
  end

  test "should get edit" do
    post user_session_url, params: { email: users(:one).email, password: "password123" }
    get edit_account_url
    assert_response :success
  end

  test "should update account" do
    post user_session_url, params: { email: users(:one).email, password: "password123" }
    patch account_url, params: { user: { email: "updated@example.com" } }
    assert_redirected_to account_url
    assert_equal "updated@example.com", users(:one).reload.email
  end
end
