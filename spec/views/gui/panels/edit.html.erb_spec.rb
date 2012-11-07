require 'spec_helper'

describe "gui/panels/edit" do
  before(:each) do
    @gui_panel = assign(:gui_panel, stub_model(Gui::Panel,
      :module => "MyString",
      :name_jp => "MyString",
      :name_en => "MyString"
    ))
  end

  it "renders the edit gui_panel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => gui_panels_path(@gui_panel), :method => "post" do
      assert_select "input#gui_panel_module", :name => "gui_panel[module]"
      assert_select "input#gui_panel_name_jp", :name => "gui_panel[name_jp]"
      assert_select "input#gui_panel_name_en", :name => "gui_panel[name_en]"
    end
  end
end
