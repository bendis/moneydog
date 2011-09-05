require 'spec_helper'

describe "/savings/show.html.erb" do
  include SavingsHelper
  before(:each) do
    assigns[:saving] = @saving = stub_model(Saving,
      :amount => 1.5
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1\.5/)
  end
end
