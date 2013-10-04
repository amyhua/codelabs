require "spec_helper"

describe CodepensController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/codepens" }.should route_to(:controller => "codepens", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/codepens/new" }.should route_to(:controller => "codepens", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/codepens/1" }.should route_to(:controller => "codepens", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/codepens/1/edit" }.should route_to(:controller => "codepens", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/codepens" }.should route_to(:controller => "codepens", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/codepens/1" }.should route_to(:controller => "codepens", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/codepens/1" }.should route_to(:controller => "codepens", :action => "destroy", :id => "1")
    end

  end
end
