require 'ruby2d'
require './game.rb'
require './snake.rb'
require './menu.rb'

set title: "SADNB SNAKE"
set fps_cap: 10

menu = Menu.new
menu.draw

game = Game.new
snake = Snake.new

on :key_held do |k|

    if k.key == 'e'
      game.easy = true
    elsif k.key == 'h'
      snake.hard = true
    end

    if k.key == 'e' || k.key == 'm' || k.key == 'h'

      song = Music.new('gamesong.mp3')
      song.play
      song.loop=true
      song.volume=20

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
          song.stop
        end

        if snake.hit_border?
          game.finish
          song.stop
        end

        if game.snake_hit_wall?(snake.x, snake.y)
          game.finish
          song.stop
        end

    end


on :key_down do |event|
      if ['up', 'down', 'left', 'right'].include?(event.key)
        if snake.can_change_direction_to?(event.key)
          snake.direction = event.key
        end
      end


      if game.finished? && event.key == 'r'
        game = Game.new
        snake = Snake.new
        song.play
        song.loop=true
        song.volume=20
        if k.key == 'e'
          game.easy = true
        elsif k.key == 'h'
          snake.hard = true
        end
      end
    end
  end
end

show
