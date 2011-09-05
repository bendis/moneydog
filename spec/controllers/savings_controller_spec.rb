require 'spec_helper'

describe SavingsController do

  def mock_saving(stubs={})
    @mock_saving ||= mock_model(Saving, stubs)
  end

  describe "GET index" do
    it "assigns all savings as @savings" do
      Saving.stub(:find).with(:all).and_return([mock_saving])
      get :index
      assigns[:savings].should == [mock_saving]
    end
  end

  describe "GET show" do
    it "assigns the requested saving as @saving" do
      Saving.stub(:find).with("37").and_return(mock_saving)
      get :show, :id => "37"
      assigns[:saving].should equal(mock_saving)
    end
  end

  describe "GET new" do
    it "assigns a new saving as @saving" do
      Saving.stub(:new).and_return(mock_saving)
      get :new
      assigns[:saving].should equal(mock_saving)
    end
  end

  describe "GET edit" do
    it "assigns the requested saving as @saving" do
      Saving.stub(:find).with("37").and_return(mock_saving)
      get :edit, :id => "37"
      assigns[:saving].should equal(mock_saving)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created saving as @saving" do
        Saving.stub(:new).with({'these' => 'params'}).and_return(mock_saving(:save => true))
        post :create, :saving => {:these => 'params'}
        assigns[:saving].should equal(mock_saving)
      end

      it "redirects to the created saving" do
        Saving.stub(:new).and_return(mock_saving(:save => true))
        post :create, :saving => {}
        response.should redirect_to(saving_url(mock_saving))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved saving as @saving" do
        Saving.stub(:new).with({'these' => 'params'}).and_return(mock_saving(:save => false))
        post :create, :saving => {:these => 'params'}
        assigns[:saving].should equal(mock_saving)
      end

      it "re-renders the 'new' template" do
        Saving.stub(:new).and_return(mock_saving(:save => false))
        post :create, :saving => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested saving" do
        Saving.should_receive(:find).with("37").and_return(mock_saving)
        mock_saving.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :saving => {:these => 'params'}
      end

      it "assigns the requested saving as @saving" do
        Saving.stub(:find).and_return(mock_saving(:update_attributes => true))
        put :update, :id => "1"
        assigns[:saving].should equal(mock_saving)
      end

      it "redirects to the saving" do
        Saving.stub(:find).and_return(mock_saving(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(saving_url(mock_saving))
      end
    end

    describe "with invalid params" do
      it "updates the requested saving" do
        Saving.should_receive(:find).with("37").and_return(mock_saving)
        mock_saving.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :saving => {:these => 'params'}
      end

      it "assigns the saving as @saving" do
        Saving.stub(:find).and_return(mock_saving(:update_attributes => false))
        put :update, :id => "1"
        assigns[:saving].should equal(mock_saving)
      end

      it "re-renders the 'edit' template" do
        Saving.stub(:find).and_return(mock_saving(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested saving" do
      Saving.should_receive(:find).with("37").and_return(mock_saving)
      mock_saving.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the savings list" do
      Saving.stub(:find).and_return(mock_saving(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(savings_url)
    end
  end

end
