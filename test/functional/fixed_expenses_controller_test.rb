require "test_helper"

class FixedExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    post user_session_url, params: { email: @user.email, password: "password123" }
  end

  test "new renders a form" do
    get new_fixed_expense_url
    assert_response :success
    assert_select "form", minimum: 1
    assert_select "input[name='fixed_expense[name]']"
  end

  test "edit renders a form" do
    get edit_fixed_expense_url(fixed_expenses(:one))
    assert_response :success
    assert_select "form", minimum: 1
    assert_select "input[name='fixed_expense[name]']"
  end
end
