require 'spec_helper'

describe "gui/images/show" do
  before(:each) do
    @gui_image = assign(:gui_image, stub_model(Gui::Image,
      :name => "Name",
      :style => "Style",
      :panel_id => 1,
      :dialog_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Style/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
