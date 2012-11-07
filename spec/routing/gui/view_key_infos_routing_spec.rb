require "spec_helper"

describe Gui::ViewKeyInfosController do
  describe "routing" do

    it "routes to #index" do
      get("/gui/view_key_infos").should route_to("gui/view_key_infos#index")
    end

    it "routes to #new" do
      get("/gui/view_key_infos/new").should route_to("gui/view_key_infos#new")
    end

    it "routes to #show" do
      get("/gui/view_key_infos/1").should route_to("gui/view_key_infos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/gui/view_key_infos/1/edit").should route_to("gui/view_key_infos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/gui/view_key_infos").should route_to("gui/view_key_infos#create")
    end

    it "routes to #update" do
      put("/gui/view_key_infos/1").should route_to("gui/view_key_infos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/gui/view_key_infos/1").should route_to("gui/view_key_infos#destroy", :id => "1")
    end

  end
end
