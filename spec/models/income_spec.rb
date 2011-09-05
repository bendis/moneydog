require 'spec_helper'

describe Income do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :amount => 1.5
    }
  end

  it "should create a new instance given valid attributes" do
    Income.create!(@valid_attributes)
  end
end
