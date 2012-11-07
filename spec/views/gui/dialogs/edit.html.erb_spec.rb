require 'spec_helper'

describe "gui/dialogs/edit" do
  before(:each) do
    @gui_dialog = assign(:gui_dialog, stub_model(Gui::Dialog,
      :module => "MyString",
      :title_jp => "MyString",
      :title_en => "MyString"
    ))
  end

  it "renders the edit gui_dialog form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => gui_dialogs_path(@gui_dialog), :method => "post" do
      assert_select "input#gui_dialog_module", :name => "gui_dialog[module]"
      assert_select "input#gui_dialog_title_jp", :name => "gui_dialog[title_jp]"
      assert_select "input#gui_dialog_title_en", :name => "gui_dialog[title_en]"
    end
  end
end
