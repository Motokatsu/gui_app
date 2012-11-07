require 'spec_helper'

describe "gui/images/edit" do
  before(:each) do
    @gui_image = assign(:gui_image, stub_model(Gui::Image,
      :name => "MyString",
      :style => "MyString",
      :panel_id => 1,
      :dialog_id => 1
    ))
  end

  it "renders the edit gui_image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => gui_images_path(@gui_image), :method => "post" do
      assert_select "input#gui_image_name", :name => "gui_image[name]"
      assert_select "input#gui_image_style", :name => "gui_image[style]"
      assert_select "input#gui_image_panel_id", :name => "gui_image[panel_id]"
      assert_select "input#gui_image_dialog_id", :name => "gui_image[dialog_id]"
    end
  end
end
