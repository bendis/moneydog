require 'spec_helper'

describe "/savings/new.html.erb" do
  include SavingsHelper

  before(:each) do
    assigns[:saving] = stub_model(Saving,
      :new_record? => true,
      :amount => 1.5
    )
  end

  it "renders new saving form" do
    render

    response.should have_tag("form[action=?][method=post]", savings_path) do
      with_tag("input#saving_amount[name=?]", "saving[amount]")
    end
  end
end
