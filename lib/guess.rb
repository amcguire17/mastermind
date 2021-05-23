class Guess
  attr_reader :user_guess
  attr_accessor :secret_code

  def initialize(secret_code)
    @secret_code = secret_code
  end

  def add_guess(guess)
    @user_guess = guess.split("")
  end

  def element
    @element_count = @secret_code.uniq.length - (@secret_code.uniq - @user_guess.uniq).length
  end

  def position
    diff = @user_guess.map.with_index do |color, index|
      color == @secret_code[index]
    end

    correct_index = diff.select do |index|
      index == true
    end

    num_correct = correct_index.length
  end

  def codebreak?
    @secret_code == @user_guess
  end
end
