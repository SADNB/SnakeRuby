require 'ruby2d'
require './Snake.rb'
require './Game.rb'

set title: "SADNB SNAKE"
set fps_cap: 20

game = Game.new
snake = Snake.new


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

show
