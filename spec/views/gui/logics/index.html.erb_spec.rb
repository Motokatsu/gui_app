require 'spec_helper'

describe "gui/logics/index" do
  before(:each) do
    assign(:gui_logics, [
      stub_model(Gui::Logic,
        :module => "Module",
        :name => "Name",
        :symbol => "Symbol",
        :lid => 1
      ),
      stub_model(Gui::Logic,
        :module => "Module",
        :name => "Name",
        :symbol => "Symbol",
        :lid => 1
      )
    ])
  end

  it "renders a list of gui/logics" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Module".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Symbol".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
