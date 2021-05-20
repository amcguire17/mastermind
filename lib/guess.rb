class Guess
  attr_reader :colors, :user_guess

  def initialize(colors)
    @colors = colors
    # @user_guess = []
  end

  def add_guess(guess)
    @user_guess = guess.split("")
  end

  def secret_code
    secret = []
    @colors.sample(4).each do |color|
      secret << color.abbr
    end
    secret
  end

  def element
    @element_counter = (secret_code.concat (@user_guess)).uniq.length
  end

  def position
    @position_counter = 0

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
