require 'spec_helper'

describe "/fixed_expenses/edit.html.erb" do
  include FixedExpensesHelper

  before(:each) do
    assigns[:fixed_expense] = @fixed_expense = stub_model(FixedExpense,
      :new_record? => false,
      :name => "value for name",
      :amount => 1.5
    )
  end

  it "renders the edit fixed_expense form" do
    render

    response.should have_tag("form[action=#{fixed_expense_path(@fixed_expense)}][method=post]") do
      with_tag('input#fixed_expense_name[name=?]', "fixed_expense[name]")
      with_tag('input#fixed_expense_amount[name=?]', "fixed_expense[amount]")
    end
  end
end
