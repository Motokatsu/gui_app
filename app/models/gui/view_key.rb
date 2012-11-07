class Gui::ViewKey < ActiveRecord::Base
  attr_accessible :name, :x, :y, :width, :height

  belongs_to :image
  has_one :view_key_info
  has_one :logic, :through => :view_key_info
end
