require "test_helper"

class ExpenseTest < ActiveSupport::TestCase
  test "valid expense" do
    expense = Expense.new(name: "Food", price: 100.0, date: Date.today, user_id: users(:one).id)
    assert expense.valid?
  end

  test "invalid without name" do
    expense = Expense.new(price: 100.0, date: Date.today, user_id: users(:one).id)
    assert_not expense.valid?
    assert expense.errors[:name].any?
  end

  test "invalid without numeric price" do
    expense = Expense.new(name: "Food", price: "abc", date: Date.today, user_id: users(:one).id)
    assert_not expense.valid?
  end

  test "for_user scope returns only user expenses" do
    user = users(:one)
    expenses = Expense.for_user(user)
    assert expenses.all? { |e| e.user_id == user.id }
  end

  test "current_month scope returns only current month expenses" do
    expenses = Expense.for_user(users(:one)).current_month
    assert expenses.all? { |e| e.date >= Date.today.beginning_of_month && e.date <= Date.today.end_of_month }
  end

  test "not_from_savings scope excludes savings expenses" do
    expenses = Expense.for_user(users(:one)).not_from_savings
    assert expenses.all? { |e| e.from_savings == false }
  end

  test "default_scope orders by date desc" do
    user = users(:one)
    # expenses fixture has records for today and 40 days ago
    user_expenses = Expense.for_user(user)
    assert user_expenses.count >= 2, "Need at least 2 expenses to test ordering"
    dates = user_expenses.map(&:date)
    assert_equal dates.sort.reverse, dates
  end

  test "month scope filters by given month" do
    date_string = Date.today.to_s
    expenses = Expense.for_user(users(:one)).month(date_string)
    assert expenses.all? { |e|
      e.date >= date_string.to_date.beginning_of_month &&
      e.date <= date_string.to_date.end_of_month
    }
  end
end
