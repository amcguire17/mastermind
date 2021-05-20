require './lib/color'
require './lib/code'
require './lib/guess'
require './lib/message'


class Game
  attr_reader :color_selection, :code, :message, :guess

def set_up_colors
  colors = [["red", "r"], ["blue", "b"], ["yellow", "y"], ["green", "g"]]

  @color_selection = []

  4.times {
    colors.map do |name, abbr|
      color = Color.new(name, abbr)
      @color_selection << color
    end
  }
end

def create_objects
  @code = Code.new(@color_selection)
  @message = Message.new
end

def start
  set_up_colors
  create_objects
  @message.greeting_message
  @message.option_message
  options = gets.chomp.downcase

  if option == 'p'
    game_play
  elsif option == 'i'
    instructions #need to make this method
  end
end




end
