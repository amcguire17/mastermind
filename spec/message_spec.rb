require './lib/message'

RSpec.describe Message do
  before(:each) do
    @message = Message.new
  end
  describe 'Opening Messages' do
    it "exists" do

      expect(@message).to be_a(Message)

    end

    it "has a greeting" do

      expect(@message.greeting_message).to eq("Welcome to MASTERMIND")

    end

    it "has options to select" do
      expect = "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

      expect(@message.options_message).to eq(expect)
    end

    it "has options to select difficulty" do
      expect = "What difficulty level would you like to play? (b)eginner, (i)ntermediate, (a)dvanced"

      expect(@message.difficulty_level_message).to eq(expect)
    end

    it "has instructions" do
      expect = ("Use (q)uit to quit at any time.")

      expect(@message.instructions_message).to eq(expect)
    end
  end

  describe 'Game Flow Messages' do
    it "has a message at game start beginner" do
      expect = ("(r)ed, (g)reen, (b)lue, (y)ellow. Use (q)uit at any time to end the game.")

      expect(@message.start_beginner_message).to eq(expect)
    end

    it "asks for a guess" do

      expect(@message.guess_message).to eq("What's your guess?")

    end

    it "give message for short guess" do

      expect(@message.short_message).to eq("Your guess is too long. Try again.")

    end

    it "give message for long guess" do

      expect(@message.long_message).to eq("Your guess is too short. Try again.")

    end

  end

  describe 'End Game Messages' do
    it "asks to play again" do
      expect = "Do you want to (p)lay again or (q)uit?"

      expect(@message.end_message).to eq(expect)
    end

  end
end
