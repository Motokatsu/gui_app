
#p Dir::pwd

view_keys = Kamuis::ViewKey.select([:id, :name]).where(:image_id => 0) 
view_keys.each do |view_key|
  p view_key.id,view_key.name
end
