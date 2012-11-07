require 'spec_helper'

describe "gui/dialogs/index" do
  before(:each) do
    assign(:gui_dialogs, [
      stub_model(Gui::Dialog,
        :module => "Module",
        :title_jp => "Title Jp",
        :title_en => "Title En"
      ),
      stub_model(Gui::Dialog,
        :module => "Module",
        :title_jp => "Title Jp",
        :title_en => "Title En"
      )
    ])
  end

  it "renders a list of gui/dialogs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Module".to_s, :count => 2
    assert_select "tr>td", :text => "Title Jp".to_s, :count => 2
    assert_select "tr>td", :text => "Title En".to_s, :count => 2
  end
end
