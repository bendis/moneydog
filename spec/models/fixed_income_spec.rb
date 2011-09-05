require 'spec_helper'

describe FixedIncome do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :amount => 1.5
    }
  end

  it "should create a new instance given valid attributes" do
    FixedIncome.create!(@valid_attributes)
  end
end
