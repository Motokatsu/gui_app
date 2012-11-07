require 'spec_helper'

describe "gui/view_key_infos/show" do
  before(:each) do
    @gui_view_key_info = assign(:gui_view_key_info, stub_model(Gui::ViewKeyInfo,
      :view_key_id => 1,
      :logic_id => 2,
      :update_on_realtime => false,
      :update_on_activate => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/false/)
    rendered.should match(/false/)
  end
end
