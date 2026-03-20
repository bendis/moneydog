require "test_helper"

class FixedExpenseTest < ActiveSupport::TestCase
  test "valid fixed expense" do
    fe = FixedExpense.new(name: "Rent", amount: 15000.0, valid_from: 1.year.ago, user_id: users(:one).id)
    assert fe.valid?
  end

  test "invalid without name" do
    fe = FixedExpense.new(amount: 15000.0, valid_from: 1.year.ago, user_id: users(:one).id)
    assert_not fe.valid?
  end

  test "invalid without valid_from" do
    fe = FixedExpense.new(name: "Rent", amount: 15000.0, user_id: users(:one).id)
    assert_not fe.valid?
  end

  test "valid scope with no end date" do
    date = Date.today
    expenses = FixedExpense.for_user(users(:one)).valid(date)
    assert expenses.any?
    assert expenses.all? { |fe|
      fe.valid_from <= date && (fe.valid_to.nil? || fe.valid_to >= date)
    }
  end

  test "for_user scope" do
    user = users(:one)
    expenses = FixedExpense.for_user(user)
    assert expenses.all? { |fe| fe.user_id == user.id }
  end
end
