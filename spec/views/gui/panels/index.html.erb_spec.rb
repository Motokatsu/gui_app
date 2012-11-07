require 'spec_helper'

describe "gui/panels/index" do
  before(:each) do
    assign(:gui_panels, [
      stub_model(Gui::Panel,
        :module => "Module",
        :name_jp => "Name Jp",
        :name_en => "Name En"
      ),
      stub_model(Gui::Panel,
        :module => "Module",
        :name_jp => "Name Jp",
        :name_en => "Name En"
      )
    ])
  end

  it "renders a list of gui/panels" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Module".to_s, :count => 2
    assert_select "tr>td", :text => "Name Jp".to_s, :count => 2
    assert_select "tr>td", :text => "Name En".to_s, :count => 2
  end
end
