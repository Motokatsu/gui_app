require 'spec_helper'

describe "gui/images/index" do
  before(:each) do
    assign(:gui_images, [
      stub_model(Gui::Image,
        :name => "Name",
        :style => "Style",
        :panel_id => 1,
        :dialog_id => 2
      ),
      stub_model(Gui::Image,
        :name => "Name",
        :style => "Style",
        :panel_id => 1,
        :dialog_id => 2
      )
    ])
  end

  it "renders a list of gui/images" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Style".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
