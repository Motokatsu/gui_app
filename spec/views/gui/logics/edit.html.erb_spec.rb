require 'spec_helper'

describe "gui/logics/edit" do
  before(:each) do
    @gui_logic = assign(:gui_logic, stub_model(Gui::Logic,
      :module => "MyString",
      :name => "MyString",
      :symbol => "MyString",
      :lid => 1
    ))
  end

  it "renders the edit gui_logic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => gui_logics_path(@gui_logic), :method => "post" do
      assert_select "input#gui_logic_module", :name => "gui_logic[module]"
      assert_select "input#gui_logic_name", :name => "gui_logic[name]"
      assert_select "input#gui_logic_symbol", :name => "gui_logic[symbol]"
      assert_select "input#gui_logic_lid", :name => "gui_logic[lid]"
    end
  end
end
