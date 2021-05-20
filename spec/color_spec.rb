require 'rspec'
require './lib/color'

RSpec.describe Color do
  it "exists" do
    color = Color.new("red", "r")

    expect(color).to be_a(Color)
  end

  it "has instance variables" do
    color = Color.new("red", "r")

    expect(color.name).to eq("red")
    expect(color.abbr).to eq("r")
  end

  it "has different color" do
    color1 = Color.new("red", "r")
    color2 = Color.new("blue", "b")

    expect(color1.name).to eq("red")
    expect(color1.abbr).to eq("r")
    expect(color2.name).to eq("blue")
    expect(color2.abbr).to eq("b")
  end

end
