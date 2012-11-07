require "spec_helper"

describe Gui::PanelsController do
  describe "routing" do

    it "routes to #index" do
      get("/gui/panels").should route_to("gui/panels#index")
    end

    it "routes to #new" do
      get("/gui/panels/new").should route_to("gui/panels#new")
    end

    it "routes to #show" do
      get("/gui/panels/1").should route_to("gui/panels#show", :id => "1")
    end

    it "routes to #edit" do
      get("/gui/panels/1/edit").should route_to("gui/panels#edit", :id => "1")
    end

    it "routes to #create" do
      post("/gui/panels").should route_to("gui/panels#create")
    end

    it "routes to #update" do
      put("/gui/panels/1").should route_to("gui/panels#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/gui/panels/1").should route_to("gui/panels#destroy", :id => "1")
    end

  end
end
