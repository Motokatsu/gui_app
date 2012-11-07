require "spec_helper"

describe Gui::ImagesController do
  describe "routing" do

    it "routes to #index" do
      get("/gui/images").should route_to("gui/images#index")
    end

    it "routes to #new" do
      get("/gui/images/new").should route_to("gui/images#new")
    end

    it "routes to #show" do
      get("/gui/images/1").should route_to("gui/images#show", :id => "1")
    end

    it "routes to #edit" do
      get("/gui/images/1/edit").should route_to("gui/images#edit", :id => "1")
    end

    it "routes to #create" do
      post("/gui/images").should route_to("gui/images#create")
    end

    it "routes to #update" do
      put("/gui/images/1").should route_to("gui/images#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/gui/images/1").should route_to("gui/images#destroy", :id => "1")
    end

  end
end
