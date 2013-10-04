require "spec_helper"

describe LessonsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/lessons" }.should route_to(:controller => "lessons", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/lessons/new" }.should route_to(:controller => "lessons", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/lessons/1" }.should route_to(:controller => "lessons", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/lessons/1/edit" }.should route_to(:controller => "lessons", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/lessons" }.should route_to(:controller => "lessons", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/lessons/1" }.should route_to(:controller => "lessons", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/lessons/1" }.should route_to(:controller => "lessons", :action => "destroy", :id => "1")
    end

  end
end
