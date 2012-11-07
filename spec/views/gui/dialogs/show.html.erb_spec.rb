require 'spec_helper'

describe "gui/dialogs/show" do
  before(:each) do
    @gui_dialog = assign(:gui_dialog, stub_model(Gui::Dialog,
      :module => "Module",
      :title_jp => "Title Jp",
      :title_en => "Title En"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Module/)
    rendered.should match(/Title Jp/)
    rendered.should match(/Title En/)
  end
end
