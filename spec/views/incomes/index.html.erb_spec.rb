require 'spec_helper'

describe "/incomes/index.html.erb" do
  include IncomesHelper

  before(:each) do
    assigns[:incomes] = [
      stub_model(Income,
        :name => "value for name",
        :amount => 1.5
      ),
      stub_model(Income,
        :name => "value for name",
        :amount => 1.5
      )
    ]
  end

  it "renders a list of incomes" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", 1.5.to_s, 2)
  end
end
