require 'spec_helper'

describe IncomesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/incomes" }.should route_to(:controller => "incomes", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/incomes/new" }.should route_to(:controller => "incomes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/incomes/1" }.should route_to(:controller => "incomes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/incomes/1/edit" }.should route_to(:controller => "incomes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/incomes" }.should route_to(:controller => "incomes", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/incomes/1" }.should route_to(:controller => "incomes", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/incomes/1" }.should route_to(:controller => "incomes", :action => "destroy", :id => "1") 
    end
  end
end
