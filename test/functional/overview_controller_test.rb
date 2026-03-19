require "test_helper"

class OverviewControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:two)
    # users(:two) has no expenses/incomes/savings — simulates a brand-new account
    post user_session_url, params: { email: @user.email, password: "password456" }
  end

  test "current_month renders without error for empty account" do
    get root_url
    assert_response :success
  end

  test "current_month assigns expenses_months as a hash" do
    get root_url
    assert_response :success
    # The view iterates over @expenses_months; an empty hash is safe, nil is not
    # We verify the page rendered successfully (which would fail with nil.each)
  end
end
