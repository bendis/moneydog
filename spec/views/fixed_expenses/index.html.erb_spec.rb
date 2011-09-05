require 'spec_helper'

describe "/fixed_expenses/index.html.erb" do
  include FixedExpensesHelper

  before(:each) do
    assigns[:fixed_expenses] = [
      stub_model(FixedExpense,
        :name => "value for name",
        :amount => 1.5
      ),
      stub_model(FixedExpense,
        :name => "value for name",
        :amount => 1.5
      )
    ]
  end

  it "renders a list of fixed_expenses" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", 1.5.to_s, 2)
  end
end
