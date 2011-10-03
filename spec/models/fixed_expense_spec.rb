require 'spec_helper'

describe FixedExpense do
  before(:each) do
    Factory(:user)
  end
  after(:all) do
    FixedExpense.destroy_all
    User.destroy_all
  end

  it "should create a new instance given valid attributes" do
    Factory.create(:fixed_expense)
  end
end
