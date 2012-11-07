class CreateGuiPanels < ActiveRecord::Migration
  def change
    create_table :gui_panels do |t|
      t.string :module
      t.string :name_jp
      t.string :name_en

      t.timestamps
    end
  end

  def self.down
    drop_table :gui_panels
  end
end
