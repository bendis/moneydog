require 'spec_helper'

describe "/incomes/new.html.erb" do
  include IncomesHelper

  before(:each) do
    assigns[:income] = stub_model(Income,
      :new_record? => true,
      :name => "value for name",
      :amount => 1.5
    )
  end

  it "renders new income form" do
    render

    response.should have_tag("form[action=?][method=post]", incomes_path) do
      with_tag("input#income_name[name=?]", "income[name]")
      with_tag("input#income_amount[name=?]", "income[amount]")
    end
  end
end
