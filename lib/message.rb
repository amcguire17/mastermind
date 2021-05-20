class Message

  def greeting_message
    p "Welcome to MASTERMIND"
  end

  def options_message
    p "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def instructions_message
    p "TBD"
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
