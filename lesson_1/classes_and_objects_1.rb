class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def speed_up(n)
    @current_speed += n
    "You speed up to #{@current_speed} mph."
  end

  def brake(n)
    @current_speed -= n
    "You slow down to #{@current_speed} mph."
  end

  def current_speed
    "You are now going #{@current_speed} mph."
  end

  def shut_the_char
    @current_speed = 0
    "Vehicle is now turned off."
  end

  def spray_paint(color)
    self.color = color
    "Your vehicle is now color: #{color}"
  end
end

toyota = MyCar.new(2020, "black", "corolla")
puts toyota.color
puts toyota.spray_paint("blue")
puts toyota.color