
#p Dir::pwd

Dir::glob("../demo_app/kamui/config/gui/database/ke_module_*.db").each do |f|
  db = SQLite3::Database.new(f)
  db.execute('select * from ke_module') do |row|
    p row[1]
    name = row[1]
    view_key = Gui::ViewKey.new(:name=>name, :x=>0, :y=>0, :width=>0, :height=>0)
    if view_key.save
      p "save success!"
    else
      p "save error!"
    end
  end
  db.close
end

#Kamuis::ViewKey.all.each do |view_key| 
#  p view_key.id
#end
