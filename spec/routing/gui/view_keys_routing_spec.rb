require "spec_helper"

describe Gui::ViewKeysController do
  describe "routing" do

    it "routes to #index" do
      get("/gui/view_keys").should route_to("gui/view_keys#index")
    end

    it "routes to #new" do
      get("/gui/view_keys/new").should route_to("gui/view_keys#new")
    end

    it "routes to #show" do
      get("/gui/view_keys/1").should route_to("gui/view_keys#show", :id => "1")
    end

    it "routes to #edit" do
      get("/gui/view_keys/1/edit").should route_to("gui/view_keys#edit", :id => "1")
    end

    it "routes to #create" do
      post("/gui/view_keys").should route_to("gui/view_keys#create")
    end

    it "routes to #update" do
      put("/gui/view_keys/1").should route_to("gui/view_keys#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/gui/view_keys/1").should route_to("gui/view_keys#destroy", :id => "1")
    end

  end
end
