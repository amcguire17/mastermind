require './lib/color'
require './lib/code'

RSpec.describe Code do
  it "exists" do
    code = Code.new("b")

    expect(code).to be_a(Code)
  end

  it "has a difficulty levels" do
    code1 = Code.new("b")

    expect(code1.difficulty_level).to eq("b")

    code2 = Code.new("i")

    expect(code2.difficulty_level).to eq("i")

    code3 = Code.new("a")

    expect(code3.difficulty_level).to eq("a")

  end


  it "has different colors in each level" do
    code1 = Code.new("b")

    expect(code1.color_selection[0].name).to eq("red")
    expect(code1.color_selection[1].name).to eq("blue")
    expect(code1.color_selection[2].name).to eq("yellow")
    expect(code1.color_selection[3].name).to eq("green")

    code2 = Code.new("i")

    expect(code2.color_selection[0].name).to eq("red")
    expect(code2.color_selection[1].name).to eq("blue")
    expect(code2.color_selection[2].name).to eq("yellow")
    expect(code2.color_selection[3].name).to eq("green")
    expect(code2.color_selection[4].name).to eq("purple")

    code3 = Code.new("a")

    expect(code3.color_selection[0].name).to eq("red")
    expect(code3.color_selection[1].name).to eq("blue")
    expect(code3.color_selection[2].name).to eq("yellow")
    expect(code3.color_selection[3].name).to eq("green")
    expect(code3.color_selection[4].name).to eq("purple")
    expect(code3.color_selection[5].name).to eq("orange")
  end

  it "can create secret code for each level" do
    code1 = Code.new("b")

    expect(code1.secret_code_generator).not_to eq(code1.color_selection)
    expect(code1.secret_code_generator.length).to be(4)

    code2 = Code.new("i")

    expect(code2.secret_code_generator).not_to eq(code2.color_selection)
    expect(code2.secret_code_generator.length).to be(6)

    code3 = Code.new("a")

    expect(code3.secret_code_generator).not_to eq(code3.color_selection)
    expect(code3.secret_code_generator.length).to be(8)

  end

end
