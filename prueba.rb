require 'ruby2d'
require './menu.rb'
require './snake.rb'
require './game.rb'


set title: "SADNB SNAKE"
set fps_cap: 20

def initialize
  @key_e_pressed = false

end


menu = Menu.new
menu.draw

on :key_down do |k|
  @key_e_pressed = true if ['e'].include?(k.key)
  if @key_e_pressed == true
    game = Game.new
    snake = Snake.new
    snake.draw
    game.draw
end
end



show
