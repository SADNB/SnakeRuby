class Elements
  def initialize
    @type=0
  end

  def draw_apple (x,y)
    apple = Sprite.new(
      'apple.png',
      width: GRID_WIDTH,
      height: GRID_HEIGHT,
      x: x * SQUARE_SIZE,
      y: y * SQUARE_SIZE
    )
  end

  def draw_pear (x,y)
    pear = Sprite.new(
      'pear.png',
      width: GRID_WIDTH,
      height: GRID_HEIGHT,
      x: x * SQUARE_SIZE,
      y: y * SQUARE_SIZE
    )
  end

  def draw_pineapple (x,y)
    pineapple = Sprite.new(
      'pineapple.png',
      width: GRID_WIDTH,
      height: GRID_HEIGHT,
      x: x * SQUARE_SIZE,
      y: y * SQUARE_SIZE
    )
  end

  def draw_watermelon (x,y)
    watermelon = Sprite.new(
      'watermelon.png',
      width: GRID_WIDTH,
      height: GRID_HEIGHT,
      x: x * SQUARE_SIZE,
      y: y * SQUARE_SIZE
    )
  end

  def draw_random_fruit(type,x,y)
    if type == 0
      draw_apple(x,y)
    elsif type == 1
      draw_pear(x,y)
    elsif type == 2
      draw_pineapple(x,y)
    elsif type == 3
      draw_watermelon(x,y)
    end
  end

  def draw_wall (x,y)
    wall = Sprite.new(
      'wall.png',
      width: GRID_WIDTH,
      height: GRID_HEIGHT,
      x: x * SQUARE_SIZE,
      y: y * SQUARE_SIZE
    )
  end
end
