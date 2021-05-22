require './lib/color'
require './lib/code'
require './lib/guess'
require './lib/message'
require './lib/game'

RSpec.describe Game do
  it "exists" do

    expect(@game).to be_a(Game)

  end

  it "has attributes that set up other classes" do
    expect(@game.code).to be_a(Code)
    expect(@game.message).to be_a(Message)
  end
end
