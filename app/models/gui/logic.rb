class Gui::Logic < ActiveRecord::Base
  attr_accessible :module, :name, :symbol, :lid

  has_many :view_key_infos
  has_many :view_keys, :through => :view_key_infos
end
