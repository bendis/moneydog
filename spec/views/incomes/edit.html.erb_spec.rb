require 'spec_helper'

describe "/incomes/edit.html.erb" do
  include IncomesHelper

  before(:each) do
    assigns[:income] = @income = stub_model(Income,
      :new_record? => false,
      :name => "value for name",
      :amount => 1.5
    )
  end

  it "renders the edit income form" do
    render

    response.should have_tag("form[action=#{income_path(@income)}][method=post]") do
      with_tag('input#income_name[name=?]', "income[name]")
      with_tag('input#income_amount[name=?]', "income[amount]")
    end
  end
end
