require 'spec_helper'

describe "/incomes/show.html.erb" do
  include IncomesHelper
  before(:each) do
    assigns[:income] = @income = stub_model(Income,
      :name => "value for name",
      :amount => 1.5
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/1\.5/)
  end
end
