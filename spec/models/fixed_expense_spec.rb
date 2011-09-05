require 'spec_helper'

describe FixedExpense do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :amount => 1.5
    }
  end

  it "should create a new instance given valid attributes" do
    FixedExpense.create!(@valid_attributes)
  end
end
