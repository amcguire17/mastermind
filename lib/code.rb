class Code
  attr_reader :color_selection

  def initialize
    colors = [["red", "r"], ["blue", "b"], ["yellow", "y"], ["green", "g"]]

    @color_selection = []

    4.times {
      colors.map do |name, abbr|
        color = Color.new(name, abbr)
        @color_selection << color
      end
    }
  end

  def secret_code_generator
    code = []
    @color_selection.sample(4).each do |color|
      code << color.abbr
    end
    code
  end

end
