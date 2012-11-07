class CreateGuiLogics < ActiveRecord::Migration
  def change
    create_table :gui_logics do |t|
      t.string :module
      t.string :name
      t.string :symbol
      t.integer :lid

      t.timestamps
    end
  end

  def self.down
    drop_table :gui_logics
  end
end
