require 'spec_helper'

describe Saving do
  before(:each) do
    @valid_attributes = {
      :amount => 1.5
    }
  end

  it "should create a new instance given valid attributes" do
    Saving.create!(@valid_attributes)
  end
end
