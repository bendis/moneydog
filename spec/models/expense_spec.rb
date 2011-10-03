require 'spec_helper'

describe Expense do
  before(:each) do
    @expense = Factory(:expense)
    @expense_other_month = Factory(:expense_other_month)
    3.times{Factory(:expense_other_week)}
  end
  after(:all) do
    Expense.destroy_all
    User.destroy_all
  end
  

  it "should be a dumb test to show usage" do
    @expense.price.should == 500.0
    @expense.from_savings.should == false
  end

  it "should show expenses in right order" do
    assert_equal @expense_other_month, Expense.find(:all).first
  end

  it "should show expenses in right week" do
    Expense.all_for_week(1).size.should == 3
    Expense.all_for_week(0).size.should == 1
  end
  
end
