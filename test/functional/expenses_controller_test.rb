require "test_helper"

class ExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    # Simulate login
    post user_session_url, params: { email: @user.email, password: "password123" }
  end

  test "should get index" do
    get expenses_url
    assert_response :success
  end

  test "should get new" do
    get new_expense_url
    assert_response :success
  end

  test "should create expense" do
    assert_difference("Expense.count") do
      post expenses_url, params: { expense: { name: "Test Expense", price: 100.0, date: Date.today } }
    end
    assert_redirected_to expenses_url
  end

  test "should not create expense with invalid data" do
    assert_no_difference("Expense.count") do
      post expenses_url, params: { expense: { name: "", price: "abc", date: Date.today } }
    end
    assert_response :unprocessable_entity
  end

  test "should show expense" do
    get expense_url(expenses(:one))
    assert_response :success
  end

  test "should get edit" do
    get edit_expense_url(expenses(:one))
    assert_response :success
  end

  test "should update expense" do
    patch expense_url(expenses(:one)), params: { expense: { name: "Updated Expense" } }
    assert_redirected_to expenses_url
  end

  test "should destroy expense" do
    assert_difference("Expense.count", -1) do
      delete expense_url(expenses(:one))
    end
    assert_redirected_to root_url
  end

  test "should redirect to login when not authenticated" do
    delete user_session_url
    get expenses_url
    assert_redirected_to new_user_session_url
  end
end
