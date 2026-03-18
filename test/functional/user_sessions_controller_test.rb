require "test_helper"

class UserSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new login page" do
    get new_user_session_url
    assert_response :success
  end

  test "should login with valid credentials" do
    post user_session_url, params: { email: users(:one).email, password: "password123" }
    assert_redirected_to account_url
    assert_equal users(:one).id, session[:user_id]
  end

  test "should not login with invalid credentials" do
    post user_session_url, params: { email: users(:one).email, password: "wrongpassword" }
    assert_response :unprocessable_entity
    assert_nil session[:user_id]
  end

  test "should logout" do
    post user_session_url, params: { email: users(:one).email, password: "password123" }
    delete user_session_url
    assert_redirected_to new_user_session_url
    assert_nil session[:user_id]
  end
end
