class Guess
  attr_reader :colors, :user_guess
  attr_accessor :secret_code

  def initialize(colors)
    @colors = colors
    # @user_guess = []
  end

  def add_guess(guess)
    @user_guess = guess.split("")
  end

  def secret_code_generator
    @secret_code = []
    @colors.sample(4).each do |color|
      @secret_code << color.abbr
    end
    @secret_code
  end

  def element
    if (@user_guess - @secret_code).length == 0 && (@secret_code - @user_guess).length == 0
      @element_count = @secret_code.uniq.length
    elsif (@user_guess - @secret_code).length > 0
      @element_count = @secret_code.uniq.length - (@user_guess - @secret_code).length
    elsif (@secret_code - @user_guess).length > 0
      @element_count = @secret_code.uniq.length - (@secret_code - @user_guess).length
    end
  end

  def position
    diff = @user_guess.map.with_index { |x,i| x == @secret_code[i] }
    correct_index = (diff.each_index.select { |i| diff[i] })
    num_correct = correct_index.length
  end

  def codebreak?
    @secret_code == @user_guess
  end



end








# def user_input
#   loop do
#     @user_guess = gets.chomp.split("")
#     if @user_guess == secret_code.length && @user_guess.include?(@colors.uniq)
#       break
#     elsif @user_guess > secret_code.length
#       p "Your guess is too long. Try again."
#     elsif @user_guess < secret_code.length
#       p "Your guess is too short. Try again."
#     else
#       p "User input invalid. Try again."
#     end
#   end
# end
