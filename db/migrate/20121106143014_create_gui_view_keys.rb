class CreateGuiViewKeys < ActiveRecord::Migration
  def change
    create_table :gui_view_keys do |t|
      t.string :name
      t.integer :image_id, :default => 0
      t.integer :x
      t.integer :y
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end

  def self.down
    drop_table :gui_view_keys
  end
end
