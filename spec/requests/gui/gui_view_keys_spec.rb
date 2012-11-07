require 'spec_helper'

describe "Gui::ViewKeys" do
  describe "GET /gui_view_keys" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get gui_view_keys_path
      response.status.should be(200)
    end
  end
end
