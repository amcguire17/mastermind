require './lib/color'
require './lib/code'
require './lib/guess'

RSpec.describe Guess do
  before(:each) do
    @code = Code.new("b")
    @guess = Guess.new(@code)
  end

  it "exists" do

    expect(@guess).to be_a(Guess)

  end

  it "can add guesses" do

    expect(@guess.add_guess("rgby")).to eq(["r", "g", "b", "y"])
  end

  it "can compare number of elements" do

    @guess.add_guess("rrry")
    @guess.secret_code = ["r","b","y","g"]

    expect(@guess.element).to eq(2)
  end

  it "can compare number of positions" do

    @guess.add_guess("rrry")
    @guess.secret_code = ["r","b","y","g"]

    expect(@guess.position).to eq(1)
  end

  it "can decide a winner" do

    @guess.add_guess("rrry")
    @guess.secret_code = ["r","b","y","g"]

    expect(@guess.codebreak?).to eq(false)

    @guess.add_guess("rbyg")
    @guess.secret_code = ["r","b","y","g"]

    expect(@guess.codebreak?).to eq(true)

  end

end
