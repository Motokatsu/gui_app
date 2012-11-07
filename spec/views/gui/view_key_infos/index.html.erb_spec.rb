require 'spec_helper'

describe "gui/view_key_infos/index" do
  before(:each) do
    assign(:gui_view_key_infos, [
      stub_model(Gui::ViewKeyInfo,
        :view_key_id => 1,
        :logic_id => 2,
        :update_on_realtime => false,
        :update_on_activate => false
      ),
      stub_model(Gui::ViewKeyInfo,
        :view_key_id => 1,
        :logic_id => 2,
        :update_on_realtime => false,
        :update_on_activate => false
      )
    ])
  end

  it "renders a list of gui/view_key_infos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
