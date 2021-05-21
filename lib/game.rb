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

  def minutes
    @time.to_i
  end

  def seconds
    ((@time - minutes) * 60).to_i
  end


  def code_check
    if guess.codebreak? == true
      @end_time = Time.now
      @time = (@end_time - @start_time).round(0) / 60.0
      p "Congratulations! You guessed the sequence #{@secret_code.join.upcase} in #{@guess_count} guesses over #{minutes} minutes, #{seconds} seconds."
      end_game
      true
    else
      p "#{@user_guess.upcase} has #{@guess.element} of the correct elements with #{@guess.position} in the correct positions. You've taken #{@guess_count} guess"
    end
  end

  def user_guess_check
    if @user_guess.length == 4
      @guess.add_guess(@user_guess.downcase)
      retur true if code_check == true
    elsif @user_guess.downcase == 'c'
      p @secret_code.join.upcase
      end_game
      true
    elsif @user_guess.downcase == 'q'
      true
    elsif @user_guess.length < 4
      @message.long_message
    elsif @user_guess.length > 4
      @message.short_message
    else
      @message.invalid_message
    end
  end

  def game_play
    @start_time = Time.now
    @secret_code = @code.secret_code_generator
    @guess = Guess.new(@secret_code)
    @message.start_message
    @guess_count = 0
    loop do
      @guess_count += 1
      @message.guess_message
      @user_guess = gets.chomp
      if user_guess_check == true
        end_game
        break
      end
    end
  end
  def end_game
    @message.end_message
    options = gets.chomp.downcase

    if options == 'p'
      game_play
    end

  end
end
