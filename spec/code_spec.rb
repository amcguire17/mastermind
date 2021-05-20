require './lib/color'
require './lib/code'

RSpec.describe Code do
  before(:each) do
    @red = Color.new("red", "r")
    @blue = Color.new("blue", "b")
    @yellow = Color.new("yellow", "y")
    @green = Color.new("green", "g")
    @colors = [@red, @blue, @yellow, @green]
    @code = Code.new(@colors)
  end

  it "exists" do

    expect(@code).to be_a(Code)

  end


  it "has colors" do

    expect(@code.colors).to eq(@colors)

  end

  it "can create secret code" do

    expect(@code.secret_code).not_to eq(["r", "b", "y", "g"])

  end

  it "can select from more colors" do
    red2 = Color.new("red", "r")
    blue2 = Color.new("blue", "b")
    yellow2 = Color.new("yellow", "y")
    green2 = Color.new("green", "g")
    colors = [@red, @blue, @yellow, @green, red2, blue2, yellow2, green2]
    code = Code.new(colors)


    expect(code.secret_code_generator).not_to eq(colors)

  end
end
