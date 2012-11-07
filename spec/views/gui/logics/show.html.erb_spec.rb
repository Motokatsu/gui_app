require 'spec_helper'

describe "gui/logics/show" do
  before(:each) do
    @gui_logic = assign(:gui_logic, stub_model(Gui::Logic,
      :module => "Module",
      :name => "Name",
      :symbol => "Symbol",
      :lid => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Module/)
    rendered.should match(/Name/)
    rendered.should match(/Symbol/)
    rendered.should match(/1/)
  end
end
