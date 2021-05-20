require './lib/color'
require './lib/code'
require './lib/guess'
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

      expect(@message.greeting).to eq("Welcome to MASTERMIND")

    end

    it "has options to select" do
      expect = "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

      expect(@message.options).to eq(expect)
    end

  end

  describe 'Game Flow Messages' do

  end

  describe 'End Game Messages' do

  end

end
