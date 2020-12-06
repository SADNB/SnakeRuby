
class Menu

def initialize
  @started = false
  @option_easy = false
  @option_medium = false
  @option_hard = false
end

def draw

  snakemenu = Image.new('snakemenu.png', width: 200, height: 110, x: 430, y: 20,)
  applemenu = Image.new('apple.png', width: 50, height: 50, x: 360, y: 60,)
  pearmenu = Image.new('pear.png', width: 40, height: 40, x: 270, y: 60,)
  watermelonmenu = Image.new('watermelon.png', width: 40, height: 40, x: 180, y: 60,)
  pineapplemenu = Image.new('pineapple.png', width: 40, height: 40, x: 90, y: 60,)


  text_initial = Text.new 'RUBY SNAKE', size: 70, color: 'white', x: 90, y: 150

  text_start = Text.new 'PRESS YOUR OPTION TO START', size: text_initial.height/3, color: 'white', x: 120, y: 250
  button_easy = Rectangle.new width: 140, height: 100, x: 80, y: 300
  button_easy.color = 'green'
  text_easy = Text.new 'EASY', size: button_easy.height / 4, color: 'black', x: 115, y: 330
  text_start_easy = Text.new 'PRESS E', size: text_initial.height/4, color: 'white', x: 100, y: 410

  button_medium = Rectangle.new width: 140, height: 100, x: 250, y: 300
  button_medium.color = 'orange'
  text_medium = Text.new 'MEDIUM', size: button_medium.height / 4, color: 'black', x: 270, y: 330
  text_start_medium = Text.new 'PRESS M', size: text_initial.height/4, color: 'white', x: 270, y: 410

  button_hard = Rectangle.new width: 140, height: 100, x: 420, y: 300
  button_hard.color = 'red'
  text_hard = Text.new 'HARD', size: button_hard.height / 4, color: 'black', x: 455, y: 330
  text_start_hard = Text.new 'PRESS H', size: text_initial.height/4, color: 'white', x: 440, y: 410

end

def hola
  button_hard = Rectangle.new width: 140, height: 100, x: 420, y: 300
  button_hard.color = 'blue'
  text_hard = Text.new 'HARD', size: button_hard.height / 4, color: 'black', x: 455, y: 330
  text_start_hard = Text.new 'PRESS H', size: text_initial.height/4, color: 'white', x: 440, y: 410
end


end
