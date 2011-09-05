require 'spec_helper'

describe FixedExpensesController do

  def mock_fixed_expense(stubs={})
    @mock_fixed_expense ||= mock_model(FixedExpense, stubs)
  end

  describe "GET index" do
    it "assigns all fixed_expenses as @fixed_expenses" do
      FixedExpense.stub(:find).with(:all).and_return([mock_fixed_expense])
      get :index
      assigns[:fixed_expenses].should == [mock_fixed_expense]
    end
  end

  describe "GET show" do
    it "assigns the requested fixed_expense as @fixed_expense" do
      FixedExpense.stub(:find).with("37").and_return(mock_fixed_expense)
      get :show, :id => "37"
      assigns[:fixed_expense].should equal(mock_fixed_expense)
    end
  end

  describe "GET new" do
    it "assigns a new fixed_expense as @fixed_expense" do
      FixedExpense.stub(:new).and_return(mock_fixed_expense)
      get :new
      assigns[:fixed_expense].should equal(mock_fixed_expense)
    end
  end

  describe "GET edit" do
    it "assigns the requested fixed_expense as @fixed_expense" do
      FixedExpense.stub(:find).with("37").and_return(mock_fixed_expense)
      get :edit, :id => "37"
      assigns[:fixed_expense].should equal(mock_fixed_expense)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created fixed_expense as @fixed_expense" do
        FixedExpense.stub(:new).with({'these' => 'params'}).and_return(mock_fixed_expense(:save => true))
        post :create, :fixed_expense => {:these => 'params'}
        assigns[:fixed_expense].should equal(mock_fixed_expense)
      end

      it "redirects to the created fixed_expense" do
        FixedExpense.stub(:new).and_return(mock_fixed_expense(:save => true))
        post :create, :fixed_expense => {}
        response.should redirect_to(fixed_expense_url(mock_fixed_expense))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved fixed_expense as @fixed_expense" do
        FixedExpense.stub(:new).with({'these' => 'params'}).and_return(mock_fixed_expense(:save => false))
        post :create, :fixed_expense => {:these => 'params'}
        assigns[:fixed_expense].should equal(mock_fixed_expense)
      end

      it "re-renders the 'new' template" do
        FixedExpense.stub(:new).and_return(mock_fixed_expense(:save => false))
        post :create, :fixed_expense => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested fixed_expense" do
        FixedExpense.should_receive(:find).with("37").and_return(mock_fixed_expense)
        mock_fixed_expense.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :fixed_expense => {:these => 'params'}
      end

      it "assigns the requested fixed_expense as @fixed_expense" do
        FixedExpense.stub(:find).and_return(mock_fixed_expense(:update_attributes => true))
        put :update, :id => "1"
        assigns[:fixed_expense].should equal(mock_fixed_expense)
      end

      it "redirects to the fixed_expense" do
        FixedExpense.stub(:find).and_return(mock_fixed_expense(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(fixed_expense_url(mock_fixed_expense))
      end
    end

    describe "with invalid params" do
      it "updates the requested fixed_expense" do
        FixedExpense.should_receive(:find).with("37").and_return(mock_fixed_expense)
        mock_fixed_expense.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :fixed_expense => {:these => 'params'}
      end

      it "assigns the fixed_expense as @fixed_expense" do
        FixedExpense.stub(:find).and_return(mock_fixed_expense(:update_attributes => false))
        put :update, :id => "1"
        assigns[:fixed_expense].should equal(mock_fixed_expense)
      end

      it "re-renders the 'edit' template" do
        FixedExpense.stub(:find).and_return(mock_fixed_expense(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested fixed_expense" do
      FixedExpense.should_receive(:find).with("37").and_return(mock_fixed_expense)
      mock_fixed_expense.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the fixed_expenses list" do
      FixedExpense.stub(:find).and_return(mock_fixed_expense(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(fixed_expenses_url)
    end
  end

end
