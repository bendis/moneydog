require 'spec_helper'

describe "/fixed_incomes/index.html.erb" do
  include FixedIncomesHelper

  before(:each) do
    assigns[:fixed_incomes] = [
      stub_model(FixedIncome,
        :name => "value for name",
        :amount => 1.5
      ),
      stub_model(FixedIncome,
        :name => "value for name",
        :amount => 1.5
      )
    ]
  end

  it "renders a list of fixed_incomes" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", 1.5.to_s, 2)
  end
end
