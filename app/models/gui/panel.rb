class Gui::Panel < ActiveRecord::Base
  attr_accessible :module, :name_jp, :name_en

  has_many :images
end
