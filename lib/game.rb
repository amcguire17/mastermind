require './lib/color'
require './lib/code'
require './lib/guess'
require './lib/message'


class Game
  attr_reader :code, :message, :guess
  attr_accessor :time, :user_level

  def initialize
    @message = Message.new
  end

  def start
    p @message.greeting_message
    p @message.options_message
    options = gets.chomp.downcase

    if options == 'p'
      user_difficulty_selection
    elsif options == 'i'
      instructions
    end
  end

  def instructions
    @message.instructions_message
    options = gets.chomp.downcase
    if options == 'p'
      user_difficulty_selection
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
    @guess.add_guess(@user_guess.downcase)
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
    if @user_guess.length == @secret_code.join.length
      return true if code_check == true
    elsif @user_guess.downcase == 'c'
      p @secret_code.join.upcase
      end_game
      true
    elsif @user_guess.downcase == 'q'
      true
    elsif @user_guess.length < @secret_code.join.length
      p @message.long_message
    elsif @user_guess.length > @secret_code.join.length
      p @message.short_message
    end
  end

  def user_difficulty_selection
    p @message.difficulty_level_message
    @user_level = gets.chomp.downcase
    if user_level == "i"
      intermediate_level
    elsif user_level == "a"
      advanced_level
    elsif user_level == "b"
      beginner_level
    end
  end

  def beginner_level
    @code = Code.new(user_level)
    @code.beginner_code
    @message.start_beginner_message
    game_play
  end

  def intermediate_level
    @code = Code.new(user_level)
    @code.intermediate_code
    @message.start_intermediate_message
    game_play
  end

  def advanced_level
    @code = Code.new(user_level)
    @code.advanced_code
    @message.start_advanced_message
    game_play
  end

  def game_play
    @start_time = Time.now
    @secret_code = @code.secret_code_generator
    @guess = Guess.new(@secret_code)
    @guess_count = 0
    game_loop
  end

  def game_loop
    loop do
      @guess_count += 1
      p @message.guess_message
      @user_guess = gets.chomp
      if user_guess_check == true
        break
      end
    end
  end

  def end_game
    p @message.end_message
    options = gets.chomp.downcase

    if options == 'p'
      user_difficulty_selection
    end
  end
end
