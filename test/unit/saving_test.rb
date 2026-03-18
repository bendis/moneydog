require "test_helper"

class SavingTest < ActiveSupport::TestCase
  test "valid saving" do
    saving = Saving.new(amount: 5000.0, user_id: users(:one).id)
    assert saving.valid?
  end

  test "invalid without numeric amount" do
    saving = Saving.new(amount: "abc", user_id: users(:one).id)
    assert_not saving.valid?
  end

  test "for_user scope" do
    user = users(:one)
    savings = Saving.for_user(user)
    assert savings.all? { |s| s.user_id == user.id }
  end
end
