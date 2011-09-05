require 'spec_helper'

describe "/fixed_expenses/new.html.erb" do
  include FixedExpensesHelper

  before(:each) do
    assigns[:fixed_expense] = stub_model(FixedExpense,
      :new_record? => true,
      :name => "value for name",
      :amount => 1.5
    )
  end

  it "renders new fixed_expense form" do
    render

    response.should have_tag("form[action=?][method=post]", fixed_expenses_path) do
      with_tag("input#fixed_expense_name[name=?]", "fixed_expense[name]")
      with_tag("input#fixed_expense_amount[name=?]", "fixed_expense[amount]")
    end
  end
end
