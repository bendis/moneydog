require 'spec_helper'

describe IncomesController do

  def mock_income(stubs={})
    @mock_income ||= mock_model(Income, stubs)
  end

  describe "GET index" do
    it "assigns all incomes as @incomes" do
      Income.stub(:find).with(:all).and_return([mock_income])
      get :index
      assigns[:incomes].should == [mock_income]
    end
  end

  describe "GET show" do
    it "assigns the requested income as @income" do
      Income.stub(:find).with("37").and_return(mock_income)
      get :show, :id => "37"
      assigns[:income].should equal(mock_income)
    end
  end

  describe "GET new" do
    it "assigns a new income as @income" do
      Income.stub(:new).and_return(mock_income)
      get :new
      assigns[:income].should equal(mock_income)
    end
  end

  describe "GET edit" do
    it "assigns the requested income as @income" do
      Income.stub(:find).with("37").and_return(mock_income)
      get :edit, :id => "37"
      assigns[:income].should equal(mock_income)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created income as @income" do
        Income.stub(:new).with({'these' => 'params'}).and_return(mock_income(:save => true))
        post :create, :income => {:these => 'params'}
        assigns[:income].should equal(mock_income)
      end

      it "redirects to the created income" do
        Income.stub(:new).and_return(mock_income(:save => true))
        post :create, :income => {}
        response.should redirect_to(income_url(mock_income))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved income as @income" do
        Income.stub(:new).with({'these' => 'params'}).and_return(mock_income(:save => false))
        post :create, :income => {:these => 'params'}
        assigns[:income].should equal(mock_income)
      end

      it "re-renders the 'new' template" do
        Income.stub(:new).and_return(mock_income(:save => false))
        post :create, :income => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested income" do
        Income.should_receive(:find).with("37").and_return(mock_income)
        mock_income.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :income => {:these => 'params'}
      end

      it "assigns the requested income as @income" do
        Income.stub(:find).and_return(mock_income(:update_attributes => true))
        put :update, :id => "1"
        assigns[:income].should equal(mock_income)
      end

      it "redirects to the income" do
        Income.stub(:find).and_return(mock_income(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(income_url(mock_income))
      end
    end

    describe "with invalid params" do
      it "updates the requested income" do
        Income.should_receive(:find).with("37").and_return(mock_income)
        mock_income.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :income => {:these => 'params'}
      end

      it "assigns the income as @income" do
        Income.stub(:find).and_return(mock_income(:update_attributes => false))
        put :update, :id => "1"
        assigns[:income].should equal(mock_income)
      end

      it "re-renders the 'edit' template" do
        Income.stub(:find).and_return(mock_income(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested income" do
      Income.should_receive(:find).with("37").and_return(mock_income)
      mock_income.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the incomes list" do
      Income.stub(:find).and_return(mock_income(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(incomes_url)
    end
  end

end
