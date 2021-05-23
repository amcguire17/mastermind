class Code
  attr_reader :color_selection, :colors, :chars, :difficulty_level

  def initialize(difficulty_level)
    @difficulty_level = difficulty_level
    @color_selection = []
    @colors = [
                ["red", "r"],
                ["blue", "b"],
                ["yellow", "y"],
                ["green", "g"],
                ["purple", "p"],
                ["orange", "o"]
              ]
    difficulty_selection
  end

  def difficulty_selection
    if @difficulty_level == "i"
      intermediate_code
    elsif @difficulty_level == "a"
      advanced_code
    else
      beginner_code
    end
  end

  def beginner_code
    @chars = 4
    4.times {
      @colors[0..3].map do |name, abbr|
        color = Color.new(name, abbr)
        @color_selection << color
      end
    }
  end

  def intermediate_code
    @chars = 6
    4.times {
      @colors[0..4].map do |name, abbr|
        color = Color.new(name, abbr)
        @color_selection << color
      end
    }
  end

  def advanced_code
    @chars = 8
    4.times {
      @colors[0..5].map do |name, abbr|
        color = Color.new(name, abbr)
        @color_selection << color
      end
    }
  end

  def secret_code_generator
    code = []
    @color_selection.sample(@chars).each do |color|
      code << color.abbr
    end
    code
  end

end
