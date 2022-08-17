# Exercise 1
class Vehicle
  attr_accessor :color
  attr_reader :year

  # Exercise 2
  @@number_of_vehicles = 0

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} mpg of gas"
  end

  def self.number_of_vehicles
    puts "There are #{@@number_of_vehicles} vehicles instantiated"
  end

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@number_of_vehicles += 1
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

  def shut_down
    @current_speed = 0
    "Vehicle is now turned off."
  end

  def spray_paint(color)
    self.color = color
    "Your vehicle is now color: #{color}"
  end

  # Exercise 6
  def age
    "This car is #{calc_age} years old"
  end

  private

  def calc_age
    Time.now.year - self.year
  end
end

# Exercise 3
module DashCam
  def turn_on_dashcam
    "The dashcam is now recording"
  end
end


class MyTruck < Vehicle
  OFFROAD = true

  def to_s
    "My car is a #{color}, #{year}, #{@model}"
  end
end


class MyCar < Vehicle
  SPORTSMODE = false

  # Exercise 3
  include DashCam
  def to_s
    "My car is a #{color}, #{year}, #{@model}"
  end
end

my_car = MyCar.new(2020, "black", "Toyota Corolla")
my_truck = MyTruck.new(2020, "grey", "Ford F150")

# Exercise 4
# puts MyCar.ancestors
# puts "--------------"
# puts MyTruck.ancestors
# puts "--------------"
# puts Vehicle.ancestors

# Exercise 6
# puts my_car.age

# Exercise 7
class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(name)
    grade > name.grade
  end

  protected

  def grade
    @grade
  end
end

joe = Student.new("Joe", 90)
bob = Student.new("Bob", 84)
puts "Well done!" if joe.better_grade_than?(bob)

# Exercise 8

# The problem is the method we're invoking is private, we need to make it public

