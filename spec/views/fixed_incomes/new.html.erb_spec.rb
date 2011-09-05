require 'spec_helper'

describe "/fixed_incomes/new.html.erb" do
  include FixedIncomesHelper

  before(:each) do
    assigns[:fixed_income] = stub_model(FixedIncome,
      :new_record? => true,
      :name => "value for name",
      :amount => 1.5
    )
  end

  it "renders new fixed_income form" do
    render

    response.should have_tag("form[action=?][method=post]", fixed_incomes_path) do
      with_tag("input#fixed_income_name[name=?]", "fixed_income[name]")
      with_tag("input#fixed_income_amount[name=?]", "fixed_income[amount]")
    end
  end
end
