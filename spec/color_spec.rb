require 'rspec' #see how it effects running files late... maybe remove?
require './lib/color'

RSpec.describe Color do
  it "exists" do
    color = Color.new("red", :r)

    expect(color).to be_a(Color)
  end

  it "has instance variables" do
    color = Color.new("red", :r)

    expect(color.name).to eq("red")
    expect(color.abbr).to eq(:r)
  end
end 
