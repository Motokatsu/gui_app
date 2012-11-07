class CreateGuiImages < ActiveRecord::Migration
  def change
    create_table :gui_images do |t|
      t.string :name
      t.string :style, :default => "tina"
      t.integer :panel_id, :default => 0
      t.integer :dialog_id, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :gui_images
  end
end
