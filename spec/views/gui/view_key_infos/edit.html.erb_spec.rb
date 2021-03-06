require 'spec_helper'

describe "gui/view_key_infos/edit" do
  before(:each) do
    @gui_view_key_info = assign(:gui_view_key_info, stub_model(Gui::ViewKeyInfo,
      :view_key_id => 1,
      :logic_id => 1,
      :update_on_realtime => false,
      :update_on_activate => false
    ))
  end

  it "renders the edit gui_view_key_info form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => gui_view_key_infos_path(@gui_view_key_info), :method => "post" do
      assert_select "input#gui_view_key_info_view_key_id", :name => "gui_view_key_info[view_key_id]"
      assert_select "input#gui_view_key_info_logic_id", :name => "gui_view_key_info[logic_id]"
      assert_select "input#gui_view_key_info_update_on_realtime", :name => "gui_view_key_info[update_on_realtime]"
      assert_select "input#gui_view_key_info_update_on_activate", :name => "gui_view_key_info[update_on_activate]"
    end
  end
end
