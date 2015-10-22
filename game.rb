require 'rubygems'
require 'gosu'
require 'hasu'

class GameWindow < Hasu::Window
  def initialize
    super 640, 480
    self.caption = "Snake game"
    @background_image = Gosu::Image.new("media/space.png", :tileable => false)
  end

  def update
  end

  def draw
  	@background_image.draw(0, 0, 0)
  end
end

GameWindow.run