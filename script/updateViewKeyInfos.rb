
Dir::glob("../demo_app/kamui/config/gui/database/ke_module_*.db").each do |f|
  db = SQLite3::Database.new(f)
  db.execute('select * from ke_module') do |row|
    name = row[1]
    lid = row[2]
    update_on_realtime = row[3]
    update_on_activate = row[4]

    view_key = Gui::ViewKey.find_by_name(name)
    logic = Gui::Logic.find_by_lid(eval(lid).to_i)
    view_key_info = Gui::ViewKeyInfo.new(:view_key_id=>view_key.id, :logic_id=>logic.id, :update_on_realtime=>update_on_realtime, :update_on_activate=>update_on_activate)
    if view_key_info.save
      p "save success!"
    else
      p "save error!"
    end
  end
  db.close
end
