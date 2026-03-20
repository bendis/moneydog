require "test_helper"

class IncomesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    post user_session_url, params: { email: @user.email, password: "password123" }
  end

  test "new renders a form" do
    get new_income_url
    assert_response :success
    assert_select "form", minimum: 1
    assert_select "input[name='income[name]']"
  end

  test "edit renders a form" do
    get edit_income_url(incomes(:one))
    assert_response :success
    assert_select "form", minimum: 1
    assert_select "input[name='income[name]']"
  end
end
