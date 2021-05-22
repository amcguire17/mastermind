class Message

  def greeting_message
    "Welcome to MASTERMIND"
  end

  def options_message
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def instructions_message
    p "Codemaker sets secret code made up of any combination/pattern of four colors."
    p "Secret Code can contain duplicate colors."
    p "Codebreaker tries to solve Secret Code by entering their combination of colors."
    p "Codebreaker will recieve the number of colors correctly guessed and number of correct positions."
    p "Codebreaker repeats entering combination until Secret Code is guessed."
    p "Use (c)heat at any time to see Secret Code."
    p "Use (q)uit to quit at any time."
  end

  def start_message
    p "I have generated a sequence with four elements made up of:"
    p "(r)ed, (g)reen, (b)lue, (y)ellow. Use (q)uit at any time to end the game."

  end

  def guess_message
    "What's your guess?"
  end

  def short_message
    "Your guess is too long. Try again."
  end

  def long_message
    "Your guess is too short. Try again."
  end

  def end_message
    "Do you want to (p)lay again or (q)uit?"
  end

end
