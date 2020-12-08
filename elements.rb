class Elements
  
  def draw_apple (x,y)
    apple = Image.new(
      'apple.png',
      width: GRID_WIDTH,
      height: GRID_HEIGHT,
      x: x * SQUARE_SIZE,
      y: y * SQUARE_SIZE
    )
  end

  def draw_pear (x,y)
    pear = Image.new(
      'pear.png',
      width: GRID_WIDTH,
      height: GRID_HEIGHT,
      x: x * SQUARE_SIZE,
      y: y * SQUARE_SIZE
    )
  end

  def draw_pineapple (x,y)
    pineapple = Image.new(
      'pineapple.png',
      width: GRID_WIDTH,
      height: GRID_HEIGHT,
      x: x * SQUARE_SIZE,
      y: y * SQUARE_SIZE
    )
  end

  def draw_watermelon (x,y)
    watermelon = Image.new(
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
    wall = Image.new(
      'wall.png',
      width: GRID_WIDTH,
      height: GRID_HEIGHT,
      x: x * SQUARE_SIZE,
      y: y * SQUARE_SIZE
    )
  end
end
