require 'spec_helper'

describe "/savings/index.html.erb" do
  include SavingsHelper

  before(:each) do
    assigns[:savings] = [
      stub_model(Saving,
        :amount => 1.5
      ),
      stub_model(Saving,
        :amount => 1.5
      )
    ]
  end

  it "renders a list of savings" do
    render
    response.should have_tag("tr>td", 1.5.to_s, 2)
  end
end
