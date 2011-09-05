require 'spec_helper'

describe FixedIncomesController do

  def mock_fixed_income(stubs={})
    @mock_fixed_income ||= mock_model(FixedIncome, stubs)
  end

  describe "GET index" do
    it "assigns all fixed_incomes as @fixed_incomes" do
      FixedIncome.stub(:find).with(:all).and_return([mock_fixed_income])
      get :index
      assigns[:fixed_incomes].should == [mock_fixed_income]
    end
  end

  describe "GET show" do
    it "assigns the requested fixed_income as @fixed_income" do
      FixedIncome.stub(:find).with("37").and_return(mock_fixed_income)
      get :show, :id => "37"
      assigns[:fixed_income].should equal(mock_fixed_income)
    end
  end

  describe "GET new" do
    it "assigns a new fixed_income as @fixed_income" do
      FixedIncome.stub(:new).and_return(mock_fixed_income)
      get :new
      assigns[:fixed_income].should equal(mock_fixed_income)
    end
  end

  describe "GET edit" do
    it "assigns the requested fixed_income as @fixed_income" do
      FixedIncome.stub(:find).with("37").and_return(mock_fixed_income)
      get :edit, :id => "37"
      assigns[:fixed_income].should equal(mock_fixed_income)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created fixed_income as @fixed_income" do
        FixedIncome.stub(:new).with({'these' => 'params'}).and_return(mock_fixed_income(:save => true))
        post :create, :fixed_income => {:these => 'params'}
        assigns[:fixed_income].should equal(mock_fixed_income)
      end

      it "redirects to the created fixed_income" do
        FixedIncome.stub(:new).and_return(mock_fixed_income(:save => true))
        post :create, :fixed_income => {}
        response.should redirect_to(fixed_income_url(mock_fixed_income))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved fixed_income as @fixed_income" do
        FixedIncome.stub(:new).with({'these' => 'params'}).and_return(mock_fixed_income(:save => false))
        post :create, :fixed_income => {:these => 'params'}
        assigns[:fixed_income].should equal(mock_fixed_income)
      end

      it "re-renders the 'new' template" do
        FixedIncome.stub(:new).and_return(mock_fixed_income(:save => false))
        post :create, :fixed_income => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested fixed_income" do
        FixedIncome.should_receive(:find).with("37").and_return(mock_fixed_income)
        mock_fixed_income.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :fixed_income => {:these => 'params'}
      end

      it "assigns the requested fixed_income as @fixed_income" do
        FixedIncome.stub(:find).and_return(mock_fixed_income(:update_attributes => true))
        put :update, :id => "1"
        assigns[:fixed_income].should equal(mock_fixed_income)
      end

      it "redirects to the fixed_income" do
        FixedIncome.stub(:find).and_return(mock_fixed_income(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(fixed_income_url(mock_fixed_income))
      end
    end

    describe "with invalid params" do
      it "updates the requested fixed_income" do
        FixedIncome.should_receive(:find).with("37").and_return(mock_fixed_income)
        mock_fixed_income.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :fixed_income => {:these => 'params'}
      end

      it "assigns the fixed_income as @fixed_income" do
        FixedIncome.stub(:find).and_return(mock_fixed_income(:update_attributes => false))
        put :update, :id => "1"
        assigns[:fixed_income].should equal(mock_fixed_income)
      end

      it "re-renders the 'edit' template" do
        FixedIncome.stub(:find).and_return(mock_fixed_income(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested fixed_income" do
      FixedIncome.should_receive(:find).with("37").and_return(mock_fixed_income)
      mock_fixed_income.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the fixed_incomes list" do
      FixedIncome.stub(:find).and_return(mock_fixed_income(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(fixed_incomes_url)
    end
  end

end
