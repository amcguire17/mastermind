require './lib/color'
require './lib/guess'

Rspec.describe Guess do
  before(:each) do
    @red = Color.new("red", :r)
    @blue = Color.new("blue", :b)
    @yellow = Color.new("yellow", :y)
    @green = Color.new("green", :g)
    @colors = [@red, @blue, @yellow, @green]
    @guess = Guess.new([@colors])
  end

  it "exists" do

    expect(@guess).to be_a(Guess)

  end

  it "has colors" do

    expect(@guess.colors).to eq(@colors)

  end

end
