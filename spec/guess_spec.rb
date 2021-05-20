require './lib/color'
require './lib/guess'

RSpec.describe Guess do
  before(:each) do
    @red = Color.new("red", "r")
    @blue = Color.new("blue", "b")
    @yellow = Color.new("yellow", "y")
    @green = Color.new("green", "g")
    @colors = [@red, @blue, @yellow, @green]
    @guess = Guess.new(@colors)
  end

  it "exists" do

    expect(@guess).to be_a(Guess)

  end

  it "has colors" do

    expect(@guess.colors).to eq(@colors)

  end

  it "can add guesses" do

    expect(@guess.add_guess("rgby")).to eq(["r", "g", "b", "y"])
  end

  it "can create secret code" do

    expect(@guess.secret_code).not_to eq(["r", "b", "y", "g"])

  end

  it "can select from more colors" do
    red2 = Color.new("red", "r")
    blue2 = Color.new("blue", "b")
    yellow2 = Color.new("yellow", "y")
    green2 = Color.new("green", "g")
    colors = [@red, @blue, @yellow, @green, red2, blue2, yellow2, green2]
    guess = Guess.new(colors)


    expect(guess.secret_code_generator).not_to eq(colors)

  end

  it "can compare number of elements" do

    @guess.add_guess("rrry")
    @guess.secret_code = ["r","b","y","g"]

    expect(@guess.element).to eq(4)
  end

  it "can compare number of positions" do

    @guess.add_guess("rrry")
    @guess.secret_code = ["r","b","y","g"]

    expect(@guess.position).to eq(1)
  end

end
