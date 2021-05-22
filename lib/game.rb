require './lib/color'
require './lib/code'
require './lib/guess'
require './lib/message'


class Game
  attr_reader :code, :message, :guess

  def initialize
    @code = Code.new
    @message = Message.new
  end

  def start
    p @message.greeting_message
    p @message.options_message
    options = $stdin.gets.chomp.downcase

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
    if @user_guess.length == 4
      return true if code_check == true
    elsif @user_guess.downcase == 'c'
      p @secret_code.join.upcase
      end_game
      true
    elsif @user_guess.downcase == 'q'
      true
    elsif @user_guess.length < 4
      p @message.long_message
    elsif @user_guess.length > 4
      p @message.short_message
    end
  end

  def game_play
    @start_time = Time.now
    @secret_code = @code.secret_code_generator
    @guess = Guess.new(@secret_code)
    @message.start_message
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
      game_play
    end
  end
end
