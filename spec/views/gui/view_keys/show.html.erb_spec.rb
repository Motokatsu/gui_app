require 'spec_helper'

describe "gui/view_keys/show" do
  before(:each) do
    @gui_view_key = assign(:gui_view_key, stub_model(Gui::ViewKey,
      :name => "Name",
      :image_id => 1,
      :x => 2,
      :y => 3,
      :width => 4,
      :height => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
  end
end
