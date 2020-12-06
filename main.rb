require 'ruby2d'
require './game.rb'
require './snake.rb'
require './menu.rb'

set title: "SADNB SNAKE"
set fps_cap: 10

@key_e_pressed = false
@key_m_pressed = false
@key_h_pressed = false

menu = Menu.new
menu.draw

game = Game.new
snake = Snake.new

on :key_held do |k|

    if k.key == 'e'
      game.easy = true
      set fps_cap: 10
    end

    if k.key == 'm'
      game.easy = false
      set fps_cap: 15
    end
    
    if k.key == 'e' || k.key == 'm'

  update do
    clear

    unless game.finished?
      snake.move
    end

    snake.draw
    game.draw

    if game.snake_hit_fruit?(snake.x, snake.y)
      game.record_hit
      snake.grow
    end

    if snake.hit_itself?
      game.finish
      gameover=Music.new('GameOver.wav')
      gameover.play
      gameover.volume=75
    end

    if game.snake_hit_wall?(snake.x, snake.y)
      game.finish
      gameover=Music.new('GameOver.wav')
      gameover.play
      gameover.volume=75
    end

end


on :key_down do |event|
      if ['up', 'down', 'left', 'right'].include?(event.key)
        if snake.can_change_direction_to?(event.key)
          snake.direction = event.key
        end
      end


      if game.finished? && event.key == 'r'
        snake = Snake.new
        game = Game.new
      end
    end
  end
end

show
