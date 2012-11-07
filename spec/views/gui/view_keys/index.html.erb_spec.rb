require 'spec_helper'

describe "gui/view_keys/index" do
  before(:each) do
    assign(:gui_view_keys, [
      stub_model(Gui::ViewKey,
        :name => "Name",
        :image_id => 1,
        :x => 2,
        :y => 3,
        :width => 4,
        :height => 5
      ),
      stub_model(Gui::ViewKey,
        :name => "Name",
        :image_id => 1,
        :x => 2,
        :y => 3,
        :width => 4,
        :height => 5
      )
    ])
  end

  it "renders a list of gui/view_keys" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
