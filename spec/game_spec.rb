require './lib/color'
require './lib/code'
require './lib/guess'
require './lib/message'
require './lib/game'

RSpec.describe Game do
  before(:each) do
    @game = Game.new
  end

  it "exists" do

    expect(@game).to be_a(Game)

  end

  it "has attributes that set up other classes" do
    expect(@game.code).to be_a(Code)
    expect(@game.message).to be_a(Message)
  end

  it "has time" do
    @game.time = 0.7167

    expect(@game.seconds).to eq(43)
    expect(@game.minutes).to eq(0)

    @game.time = 4.7167

    expect(@game.seconds).to eq(43)
    expect(@game.minutes).to eq(4)
  end
end
