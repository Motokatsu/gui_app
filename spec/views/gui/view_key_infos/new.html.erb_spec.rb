require 'spec_helper'

describe "gui/view_key_infos/new" do
  before(:each) do
    assign(:gui_view_key_info, stub_model(Gui::ViewKeyInfo,
      :view_key_id => 1,
      :logic_id => 1,
      :update_on_realtime => false,
      :update_on_activate => false
    ).as_new_record)
  end

  it "renders new gui_view_key_info form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => gui_view_key_infos_path, :method => "post" do
      assert_select "input#gui_view_key_info_view_key_id", :name => "gui_view_key_info[view_key_id]"
      assert_select "input#gui_view_key_info_logic_id", :name => "gui_view_key_info[logic_id]"
      assert_select "input#gui_view_key_info_update_on_realtime", :name => "gui_view_key_info[update_on_realtime]"
      assert_select "input#gui_view_key_info_update_on_activate", :name => "gui_view_key_info[update_on_activate]"
    end
  end
end
