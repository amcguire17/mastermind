class Guess
  attr_reader :colors, :user_guess

  def initialize(colors)
    @colors = colors
    @user_guess = []
  end

  def add_guess(guess)
    @user_guess << guess
  end

  def secret_code
    @colors.sample(4)
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
