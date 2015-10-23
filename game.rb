require 'rubygems'
require 'gosu'
require 'hasu'

class GameWindow < Hasu::Window
  def initialize
    super 640, 480
    self.caption = "Snake Game"

    @background_image = Gosu::Image.new("media/space.png", :tileable => true)

    @snake = Snake.new
    @snake.warp(320, 240)
  end

  def update
    if Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft then
      @snake.turn_left
    end
    if Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight then
      @snake.turn_right
    end
    @snake.move
  end

  def draw
    @snake.draw
    @background_image.draw(0, 0, 0);
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end

  class Snake
  def initialize
    @image = Gosu::Image.new("media/snake.png")
    @x = @y = @vel_x = @angle = 0.0
    @vel_y = -1.0
    @score = 0
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def turn_left
    @angle -= 12
  end

  def turn_right
    @angle += 12
  end

  def move
  	@vel_x = Gosu::offset_x(@angle, 1)
    @vel_y = Gosu::offset_y(@angle, 1)
    @x += @vel_x
    @y += @vel_y
    @x %= 640
    @y %= 480

    @vel_x *= 1
    @vel_y *= 1
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end
end

GameWindow.run

