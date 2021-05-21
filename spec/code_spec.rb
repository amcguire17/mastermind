require './lib/color'
require './lib/code'

RSpec.describe Code do
  before(:each) do
    @code = Code.new
  end

  it "exists" do

    expect(@code).to be_a(Code)

  end


  it "has colors" do

    expect(@code.color_selection[0].name).to eq("red")
    expect(@code.color_selection[1].name).to eq("blue")
    expect(@code.color_selection[2].name).to eq("yellow")
    expect(@code.color_selection[3].name).to eq("green")

  end

  it "can create secret code" do

    expect(@code.secret_code_generator).not_to eq(@code.color_selection)
    expect(@code.secret_code_generator.length).to be(4)

  end

end
