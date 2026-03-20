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

  test "should logout via DELETE and redirect to login page" do
    post user_session_url, params: { email: users(:one).email, password: "password123" }
    assert_equal users(:one).id, session[:user_id], "should be logged in before logout"

    delete user_session_url
    assert_redirected_to new_user_session_url
    assert_nil session[:user_id], "session user_id should be nil after logout"
  end

  test "logout clears the entire session" do
    post user_session_url, params: { email: users(:one).email, password: "password123" }
    session[:some_other_key] = "value"

    delete user_session_url
    assert_nil session[:user_id]
    assert_nil session[:some_other_key], "logout should clear all session data"
  end

  test "cannot access protected page after logout" do
    post user_session_url, params: { email: users(:one).email, password: "password123" }
    delete user_session_url

    get expenses_url
    assert_redirected_to new_user_session_url
  end

  test "logout requires authenticated user" do
    delete user_session_url
    assert_redirected_to new_user_session_url
  end

  test "GET to user_session path does not log out" do
    post user_session_url, params: { email: users(:one).email, password: "password123" }
    assert_equal users(:one).id, session[:user_id]

    # A plain GET (i.e., clicking a plain link without JS method override) must not destroy the session.
    # Rails has no GET route for user_session, so it returns 404.
    get user_session_url
    assert_response :not_found
    assert_equal users(:one).id, session[:user_id], "session must not be cleared by a GET request"
  end
end
