class Gui::ViewKeyInfo < ActiveRecord::Base
  attr_accessible :view_key_id, :logic_id, :update_on_realtime, :update_on_activate

  belongs_to :view_key
  belongs_to :logic
end
