require 'spec_helper'

describe FixedExpensesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/fixed_expenses" }.should route_to(:controller => "fixed_expenses", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/fixed_expenses/new" }.should route_to(:controller => "fixed_expenses", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/fixed_expenses/1" }.should route_to(:controller => "fixed_expenses", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/fixed_expenses/1/edit" }.should route_to(:controller => "fixed_expenses", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/fixed_expenses" }.should route_to(:controller => "fixed_expenses", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/fixed_expenses/1" }.should route_to(:controller => "fixed_expenses", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/fixed_expenses/1" }.should route_to(:controller => "fixed_expenses", :action => "destroy", :id => "1") 
    end
  end
end
