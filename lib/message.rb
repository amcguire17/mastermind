class Message

  def greeting_message
    p "Welcome to MASTERMIND"
  end

  def options_message
    p "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def instructions_message
    p i_1 = "Codemaker sets secret code made up of any combination/pattern of four colors."
    p i_2 = "Secret Code can contain duplicate colors."
    p i_3 = "Codebreaker tries to solve Secret Code by entering their combination of colors."
    p i_4 = "Codebreaker will recieve the number of colors correctly guessed and number of correct positions."
    p i_5 = "Codebreaker repeats entering combination until Secret Code is guessed."
    p i_6 = "Use (c)heat at any time to see Secret Code."
    p i_7 = "Use (q)uit to quit at any time."
  end

  def start_message
    p "I have generated a sequence with four elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow. Use (q)uit at any time to end the game."
  end

  def guess_message
    p "What's your guess?"
  end

  def short_message
    p "Your guess is too long. Try again."
  end

  def long_message
    p "Your guess is too short. Try again."
  end

  def invalid_message
    p "User input invalid. Try again."
  end

  def end_message
    p "Do you want to (p)lay again or (q)uit?"
  end

end
