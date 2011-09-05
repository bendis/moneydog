require 'spec_helper'

describe FixedIncomesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/fixed_incomes" }.should route_to(:controller => "fixed_incomes", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/fixed_incomes/new" }.should route_to(:controller => "fixed_incomes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/fixed_incomes/1" }.should route_to(:controller => "fixed_incomes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/fixed_incomes/1/edit" }.should route_to(:controller => "fixed_incomes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/fixed_incomes" }.should route_to(:controller => "fixed_incomes", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/fixed_incomes/1" }.should route_to(:controller => "fixed_incomes", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/fixed_incomes/1" }.should route_to(:controller => "fixed_incomes", :action => "destroy", :id => "1") 
    end
  end
end
