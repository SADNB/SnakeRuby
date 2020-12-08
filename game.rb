require './elements.rb'
class Game
  attr_writer :easy

  def initialize
    @fruit_x = rand(Window.width / SQUARE_SIZE)
    @fruit_y = rand(Window.height / SQUARE_SIZE)
    @walls=[[10,12],[25,2],[24,2],[21,13],[22,13],[22,14],[4,4],[4,5],[4,6],[4,7],[4,8],[4,9],[5,9],[26,26],[20,2],[21,3]]
    @score = 0
    @finished = false
    @drawn=true
    @type=rand(4)
    @sound=false
    @easy=false
  end

  def draw
    if @easy == false
    e=Elements.new
    @walls.each do |xy|
      e.draw_wall(xy[0],xy[1])
    end
end
    draw_fruit(@fruit_x,@fruit_y)
    Text.new(text_message, color: 'white', x: 10, y: 10, size: 25)
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
    if @easy == false
      @walls[0][0] == x && @walls[0][1] == y || @walls[1][0] == x && @walls[1][1] == y || @walls[2][0] == x && @walls[2][1] == y || @walls[3][0] == x && @walls[3][1] == y ||
      @walls[4][0] == x && @walls[4][1] == y || @walls[5][0] == x && @walls[5][1] == y || @walls[6][0] == x && @walls[6][1] == y || @walls[7][0] == x && @walls[7][1] == y ||
      @walls[8][0] == x && @walls[8][1] == y || @walls[9][0] == x && @walls[9][1] == y || @walls[10][0] == x && @walls[10][1] == y || @walls[11][0] == x && @walls[11][1] == y ||
      @walls[12][0] == x && @walls[12][1] == y || @walls[13][0] == x && @walls[13][1] == y || @walls[14][0] == x && @walls[14][1] == y || @walls[15][0] == x && @walls[15][1] == y
    end
end


  def record_hit
    yum=Sound.new('EatSound.ogg')
    yum.play
    @score += 1
    @fruit_x = rand(Window.width / SQUARE_SIZE)
    @fruit_y = rand(Window.height / SQUARE_SIZE)
    @drawn=false
    draw_fruit(@fruit_x,@fruit_y)
  end

  def finish
    if !@finished
      @finished = true
    end
  end

  def finished?
    @finished
  end

  def text_message
    if finished?
      "Game over, Your Score was #{@score}. Press 'R' to restart. "
    else
      "Score: #{@score}"
    end
  end
end
