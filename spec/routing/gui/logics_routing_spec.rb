require "spec_helper"

describe Gui::LogicsController do
  describe "routing" do

    it "routes to #index" do
      get("/gui/logics").should route_to("gui/logics#index")
    end

    it "routes to #new" do
      get("/gui/logics/new").should route_to("gui/logics#new")
    end

    it "routes to #show" do
      get("/gui/logics/1").should route_to("gui/logics#show", :id => "1")
    end

    it "routes to #edit" do
      get("/gui/logics/1/edit").should route_to("gui/logics#edit", :id => "1")
    end

    it "routes to #create" do
      post("/gui/logics").should route_to("gui/logics#create")
    end

    it "routes to #update" do
      put("/gui/logics/1").should route_to("gui/logics#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/gui/logics/1").should route_to("gui/logics#destroy", :id => "1")
    end

  end
end
