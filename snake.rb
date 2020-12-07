SQUARE_SIZE=20;
GRID_WIDTH = Window.width / SQUARE_SIZE
GRID_HEIGHT = Window.height / SQUARE_SIZE
class Snake
  attr_writer :direction
  attr_writer :hard

  def initialize
    @positions = [[2, 0], [2, 1], [2, 2], [2 ,3]]
    @direction = 'down'
    @growing = false
    @hard=false
  end

  def draw
    grass=Image.new('grass.jpg',
    width: Window.width,
    height: Window.height,
    )
  @positions[0..@positions.length-2].each do |position|
    snakebody = Sprite.new(
      'snakebody.png',
      width: GRID_WIDTH,
      height: GRID_HEIGHT,
      loop: false,
      x: position[0] * SQUARE_SIZE,
      y: position[1] * SQUARE_SIZE,
      rotate:270
    )
    if @direction=='up'
    snakebody.rotate=90
    elsif @direction=='left'
    snakebody.rotate=0
    elsif @direction=='down'
    snakebody.rotate=270
    elsif @direction=='right'
    snakebody.rotate=180
    end
    end
    snakehead = Sprite.new(
      'snakehead.png',
      width: GRID_WIDTH,
      height: GRID_HEIGHT,
      loop: true,
      x: head[0] * SQUARE_SIZE,
      y: head[1] * SQUARE_SIZE,
      rotate:270
    )
    if @direction=='up'
    snakehead.rotate=90
    elsif @direction=='left'
    snakehead.rotate=0
    elsif @direction=='down'
    snakehead.rotate=270
    elsif @direction=='right'
    snakehead.rotate=180
    end
  head=snakehead
  end

  def grow
    @growing = true
  end

  def move
    if !@growing
      @positions.shift
    end
    @positions.push(next_position)
    @growing = false
  end

  def can_change_direction_to?(new_direction)
    case @direction
    when 'up' then new_direction != 'down'
    when 'down' then new_direction != 'up'
    when 'left' then new_direction != 'right'
    when 'right' then new_direction != 'left'
    end
  end

  def x
    head[0]
  end

  def y
    head[1]
  end

  def next_position
    if @direction == 'down'
      new_coords(head[0], head[1] + 1)
    elsif @direction == 'up'
      new_coords(head[0], head[1] - 1)
    elsif @direction == 'left'
      new_coords(head[0] - 1, head[1])
    elsif @direction == 'right'
      new_coords(head[0] + 1, head[1])
    end
  end

  def hit_itself?
    @positions.uniq.length != @positions.length
  end

  def hit_border?
    head[0]<0 || head[0]>GRID_WIDTH-1 || head[1]<0 || head[1]>GRID_HEIGHT-1
  end

  def new_coords(x, y)
    if !@hard
      [x % GRID_WIDTH, y % GRID_HEIGHT]
    else
      [x,y]
    end
  end

  def head
    @positions.last
  end
end
