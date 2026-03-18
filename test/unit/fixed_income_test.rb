require "test_helper"

class FixedIncomeTest < ActiveSupport::TestCase
  test "valid fixed income" do
    fi = FixedIncome.new(name: "Salary", amount: 50000.0, valid_from: 1.year.ago, user_id: users(:one).id)
    assert fi.valid?
  end

  test "invalid without name" do
    fi = FixedIncome.new(amount: 50000.0, valid_from: 1.year.ago, user_id: users(:one).id)
    assert_not fi.valid?
  end

  test "invalid without valid_from" do
    fi = FixedIncome.new(name: "Salary", amount: 50000.0, user_id: users(:one).id)
    assert_not fi.valid?
  end

  test "valid scope" do
    date = Date.today
    incomes = FixedIncome.for_user(users(:one)).valid(date)
    assert incomes.any?
    assert incomes.all? { |fi|
      fi.valid_from <= date && (fi.valid_to.nil? || fi.valid_to >= date)
    }
  end

  test "for_user scope" do
    user = users(:one)
    incomes = FixedIncome.for_user(user)
    assert incomes.all? { |fi| fi.user_id == user.id }
  end
end
