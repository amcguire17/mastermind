class Code
  attr_reader :colors, :secret_code

  def initialize(colors)
    @colors = colors
  end

  def secret_code_generator
    @secret_code = []
    @colors.sample(4).each do |color|
      @secret_code << color.abbr
    end
    @secret_code
  end

end
