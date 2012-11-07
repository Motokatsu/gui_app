require 'image_size'

class Gui::Image < ActiveRecord::Base
  attr_accessible :name, :style
  attr_accessor :width, :height

  belongs_to :panel
  belongs_to :dialog
  has_many :view_keys

  IMAGE_DIR = "public/images"

  def width
    if @width.nil?
      init_size()
    end
    @width    
  end

  def height
    if @height.nil?
      init_size()
    end
    @height
  end

  def save(image_data)
    return false unless super()
    if ! panel.nil?
      self.name = "panel_" + panel.module + "_#{self.id}" + File.extname(image_data.original_filename)
    elsif ! dialog.nil?
      self.name = "dialog_" + dialog.module + "_#{self.id}" + File.extname(image_data.original_filename)
    else
      return false
    end
    path = File.join(image_dir(), self.name)
    File.open(path, "wb") { |f|
      f.write(image_data.read)
    }
    unless File.exists?(path)
      destroy()
      return false
    end
    unless super()
      destroy()
      return false
    end
    true
  end

  def destroy
    super()
    path = File.join(image_dir(), self.name)
    File.delete(path) if File.exists?(path)
  end

  def init_size
    @width = @height = 0
    path = File.join(image_dir(), self.name)
    if File.exists?(path)
      File.open(path, "rb") { |f|
        i_size = ImageSize.new(f.read)
        @width = i_size.get_width
        @height = i_size.get_height
      }
    end
  end

  def image_dir
    IMAGE_DIR + "/" + self.style
  end

  def image_size
    path = File.join(image_dir(), self.name)
    size = {:width => 0, :height => 0}
    if File.exists?(path)
      File.open(path, "rb") { |f|
        i_size = ImageSize.new(f.read)
        size[:width] = i_size.get_width
        size[:height] = i_size.get_height
      }
    end
    size
  end
end
