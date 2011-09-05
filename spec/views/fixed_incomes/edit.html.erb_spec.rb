require 'spec_helper'

describe "/fixed_incomes/edit.html.erb" do
  include FixedIncomesHelper

  before(:each) do
    assigns[:fixed_income] = @fixed_income = stub_model(FixedIncome,
      :new_record? => false,
      :name => "value for name",
      :amount => 1.5
    )
  end

  it "renders the edit fixed_income form" do
    render

    response.should have_tag("form[action=#{fixed_income_path(@fixed_income)}][method=post]") do
      with_tag('input#fixed_income_name[name=?]', "fixed_income[name]")
      with_tag('input#fixed_income_amount[name=?]', "fixed_income[amount]")
    end
  end
end
