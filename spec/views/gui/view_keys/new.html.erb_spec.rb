require 'spec_helper'

describe "gui/view_keys/new" do
  before(:each) do
    assign(:gui_view_key, stub_model(Gui::ViewKey,
      :name => "MyString",
      :image_id => 1,
      :x => 1,
      :y => 1,
      :width => 1,
      :height => 1
    ).as_new_record)
  end

  it "renders new gui_view_key form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => gui_view_keys_path, :method => "post" do
      assert_select "input#gui_view_key_name", :name => "gui_view_key[name]"
      assert_select "input#gui_view_key_image_id", :name => "gui_view_key[image_id]"
      assert_select "input#gui_view_key_x", :name => "gui_view_key[x]"
      assert_select "input#gui_view_key_y", :name => "gui_view_key[y]"
      assert_select "input#gui_view_key_width", :name => "gui_view_key[width]"
      assert_select "input#gui_view_key_height", :name => "gui_view_key[height]"
    end
  end
end
