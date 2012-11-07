require 'spec_helper'

describe "gui/panels/show" do
  before(:each) do
    @gui_panel = assign(:gui_panel, stub_model(Gui::Panel,
      :module => "Module",
      :name_jp => "Name Jp",
      :name_en => "Name En"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Module/)
    rendered.should match(/Name Jp/)
    rendered.should match(/Name En/)
  end
end
