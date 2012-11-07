require "spec_helper"

describe Gui::DialogsController do
  describe "routing" do

    it "routes to #index" do
      get("/gui/dialogs").should route_to("gui/dialogs#index")
    end

    it "routes to #new" do
      get("/gui/dialogs/new").should route_to("gui/dialogs#new")
    end

    it "routes to #show" do
      get("/gui/dialogs/1").should route_to("gui/dialogs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/gui/dialogs/1/edit").should route_to("gui/dialogs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/gui/dialogs").should route_to("gui/dialogs#create")
    end

    it "routes to #update" do
      put("/gui/dialogs/1").should route_to("gui/dialogs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/gui/dialogs/1").should route_to("gui/dialogs#destroy", :id => "1")
    end

  end
end
