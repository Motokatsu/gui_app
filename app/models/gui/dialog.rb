class Gui::Dialog < ActiveRecord::Base
  attr_accessible :module, :title_jp, :title_en

  has_many :images
end
