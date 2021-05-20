class Code
  attr_reader :colors

  def initialize(colors)
    @colors = colors
  end

  def secret_code_generator
    code = []
    @colors.sample(4).each do |color|
      code << color.abbr
    end
    code
  end

end
