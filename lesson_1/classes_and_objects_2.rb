class MyCar
  attr_accessor :color
  attr_reader :year

  # Example 1
  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} mpg of gas"

  end

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

  # Example 2
  def to_s
    "My car is a #{color}, #{year}, #{@model}"
  end
end


# toyota = MyCar.new(2020, "black", "corolla")
# puts toyota

# Example 3

class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
puts bob.name

# If we want to reassign the instance variable name by using a setter_method, we first need to initialize a setter method by either creating one ourselves, or using attr_writer to create one for us
