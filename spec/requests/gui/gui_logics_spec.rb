require 'spec_helper'

describe "Gui::Logics" do
  describe "GET /gui_logics" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get gui_logics_path
      response.status.should be(200)
    end
  end
end
