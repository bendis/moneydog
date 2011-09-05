require 'spec_helper'

describe "/savings/edit.html.erb" do
  include SavingsHelper

  before(:each) do
    assigns[:saving] = @saving = stub_model(Saving,
      :new_record? => false,
      :amount => 1.5
    )
  end

  it "renders the edit saving form" do
    render

    response.should have_tag("form[action=#{saving_path(@saving)}][method=post]") do
      with_tag('input#saving_amount[name=?]', "saving[amount]")
    end
  end
end
