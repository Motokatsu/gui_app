class AddViewKeyNameUniquenessIndex < ActiveRecord::Migration
  def up
    add_index :gui_view_keys, :name, :unique => true
  end

  def down
    remove_index :gui_view_keys, :name
  end
end
