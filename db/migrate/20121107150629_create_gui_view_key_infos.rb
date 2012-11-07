class CreateGuiViewKeyInfos < ActiveRecord::Migration
  def change
    create_table :gui_view_key_infos do |t|
      t.integer :view_key_id
      t.integer :logic_id
      t.boolean :update_on_realtime
      t.boolean :update_on_activate

      t.timestamps
    end
  end

  def self.down
    drop_table :gui_view_key_infos
  end
end
