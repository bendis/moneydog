require "test_helper"

class IncomeTest < ActiveSupport::TestCase
  test "valid income" do
    income = Income.new(name: "Salary", amount: 50000.0, date: Date.today, user_id: users(:one).id)
    assert income.valid?
  end

  test "invalid without name" do
    income = Income.new(amount: 50000.0, date: Date.today, user_id: users(:one).id)
    assert_not income.valid?
  end

  test "invalid without amount" do
    income = Income.new(name: "Salary", date: Date.today, user_id: users(:one).id)
    assert_not income.valid?
  end

  test "for_user scope" do
    user = users(:one)
    incomes = Income.for_user(user)
    assert incomes.all? { |i| i.user_id == user.id }
  end

  test "current_month scope" do
    incomes = Income.for_user(users(:one)).current_month
    assert incomes.all? { |i| i.date >= Date.today.beginning_of_month && i.date <= Date.today.end_of_month }
  end
end
