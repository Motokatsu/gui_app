class CreateGuiDialogs < ActiveRecord::Migration
  def change
    create_table :gui_dialogs do |t|
      t.string :module
      t.string :title_jp
      t.string :title_en

      t.timestamps
    end
  end

  def self.down
    drop_table :gui_dialogs
  end
end
