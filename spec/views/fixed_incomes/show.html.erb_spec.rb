require 'spec_helper'

describe "/fixed_incomes/show.html.erb" do
  include FixedIncomesHelper
  before(:each) do
    assigns[:fixed_income] = @fixed_income = stub_model(FixedIncome,
      :name => "value for name",
      :amount => 1.5
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/1\.5/)
  end
end
