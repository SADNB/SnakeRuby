require './elements.rb'
class Game
  def initialize
    @fruit_x = rand(Window.width / SQUARE_SIZE)
    @fruit_y = rand(Window.height / SQUARE_SIZE)
    @walls=[[10,12],[25,2],[21,13],[4,4]]
    @score = 0
    @finished = false
    @drawn=true
    @type=rand(4)
    @sound=false
  end

  def draw
    e=Elements.new
    @walls.each do |xy|
      e.draw_wall(xy[0],xy[1])
    end
    draw_fruit(@fruit_x,@fruit_y)
    Text.new(text_message, color: 'white', x: 10, y: 10, size: 25, z: 1)
  end

  def draw_fruit(x,y)
    e=Elements.new
    if @drawn
      e.draw_random_fruit(@type,x,y)
    else
      @type=rand(4)
      e.draw_random_fruit(@type,x,y)
      @drawn=true
    end
  end

  def snake_hit_fruit?(x, y)
    @fruit_x == x && @fruit_y == y
  end

  def snake_hit_wall?(x, y)
    @walls[0][0] == x && @walls[0][1] == y ||   @walls[1][0] == x && @walls[1][1] == y ||  @walls[2][0] == x && @walls[2][1] == y ||  @walls[3][0] == x && @walls[3][1] == y
  end

  def record_hit
    yum=Sound.new('EatSound.ogg')
    yum.play
    @score += 1
    @fruit_x = rand(Window.width / SQUARE_SIZE)
    @fruit_y = rand(Window.height / SQUARE_SIZE)
    @drawn=false
    draw_fruit(@fruit_x,@fruit_y)
    @walls.each do |xy|
      xy[0]=rand(Window.width / SQUARE_SIZE)
      xy[1]=rand(Window.height / SQUARE_SIZE)
    end
  end

  def finish
    if !@finished
      @finished = true
    end
    puts @finished
  end

  def finished?
    @finished
  end

  private

  def text_message
    if finished?
      "Game over, Your Score was #{@score}. Press 'R' to restart. "
    else
      "Score: #{@score}"
    end
  end
end
