require 'spec_helper'

describe SavingsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/savings" }.should route_to(:controller => "savings", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/savings/new" }.should route_to(:controller => "savings", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/savings/1" }.should route_to(:controller => "savings", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/savings/1/edit" }.should route_to(:controller => "savings", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/savings" }.should route_to(:controller => "savings", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/savings/1" }.should route_to(:controller => "savings", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/savings/1" }.should route_to(:controller => "savings", :action => "destroy", :id => "1") 
    end
  end
end
