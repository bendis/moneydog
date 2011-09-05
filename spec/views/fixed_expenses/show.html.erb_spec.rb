require 'spec_helper'

describe "/fixed_expenses/show.html.erb" do
  include FixedExpensesHelper
  before(:each) do
    assigns[:fixed_expense] = @fixed_expense = stub_model(FixedExpense,
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
