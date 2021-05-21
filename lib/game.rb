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
    @message.options_message
    options = gets.chomp.downcase

    if options == 'p'
      game_play
    elsif options == 'i'
      instructions
    end
  end

  def instructions
    @message.instructions_message
    options = gets.chomp.downcase
    if options == 'p'
      game_play
    else
      start
    end
  end



  def game_play
    start_time = Time.now
    secret_code = @code.secret_code_generator
    guess = Guess.new(secret_code)
    @message.start_message
    guess_count = 0
    loop do
      guess_counter += 1
      @message.guess_message
      user_guess = gets.chomp

      if user_guess.count == 4
        guess.add_guess(user_guess.downcase)
        if codebreak? == true
          end_time = Time.now
          time = end_time - start_time
          

          p "Congratulations! You guessed the sequence #{secret_code.to_s.upcase} in #{guess_count} guesses over #{time}."
          end_game
          break
        else
          p "#{user_guess.upcase} has #{guess.element} of the correct elements with #{guess.position} in the correct positions. You've taken #{guess_count} guess"
        end
      elsif user_guess.downcase == 'c'
        p secret_code
        end_game
        break
      elsif user_guess.downcase == 'q'
        break
      elsif user_guess.count > 4
        @message.long_message
      elsif user_guess.count < 4
        @message.short_message
      else
        @message.invalid_message
      end
    end
  end
  def end_game
    @message.end_game
  end
end
