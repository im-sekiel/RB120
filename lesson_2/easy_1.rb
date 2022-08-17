# ## 1. Banner Class
# ## Behold this incomplete class for constructing boxed banners.
# ## Complete this class so that the test cases shown below work as intended. 
# ## You are free to add any methods or instance variables you need. However, do not make the implementation details public.
# ## You may assume that the input will always fit in your terminal window.

# class Banner
#   def initialize(message)
#     @message = message
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private

#   def horizontal_rule
#     '+-' + '-' * message.size + '-+'
#   end

#   def empty_line
#     '| ' + ' ' * message.size + ' |'
#   end

#   def message_line
#     "| #{@message} |"
#   end

#   private

#   attr_reader :message
# end

# ## Test Cases:
# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner
# # +--------------------------------------------+
# # |                                            |
# # | To boldly go where no one has gone before. |
# # |                                            |
# # +--------------------------------------------+


# banner = Banner.new('')
# puts banner
# # +--+
# # |  |
# # |  |
# # |  |
# # +--+

## 2. What's the Output?
## Take a look at the following code:
## What output does this code print? Fix this class so that there are no surprises waiting in store for the unsuspecting developer.

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name}."
  end
end

# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

## Further Exploration
## What would happen in this case?

# name = 42
# fluffy = Pet.new(name)
# name += 1
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

## On Line 79, we point the integer object to variable `name`. 
## Variable `name` gets passed as an argument to the instance of object class Pet
## => It's important to note that we invoke the to_s method on object integer `42`, which simply turns the integer into a string
## Line 82, we invoke the puts method, pass in object `fluffy` and invoke the `name` method on fluffy
## => This outputs the string object `'42'` which is stores in the variable instance `@name` 
## We can ignore line 81, and 85, as those pertain to the local variable name, not the instance variable @name

## 3. Fix the Program - Books (Part 1)
## Complete this program so that it produces the expected output:

# class Book
#   attr_reader :title, :author

#   def initialize(author, title)
#     @author = author
#     @title = title
#   end

#   def to_s
#     %("#{title}", by #{author})
#   end
# end

# book = Book.new("Neil Stephenson", "Snow Crash")
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)

## Expected output:
## The author of "Snow Crash" is Neil Stephenson.
## book = "Snow Crash", by Neil Stephenson.

## 4. Fix the Program - Books (Part 2)
## Complete this program so that it produces the expected output:

# class Book
#   attr_accessor :title, :author
#   def to_s
#     %("#{title}", by #{author})
#   end
# end

# book = Book.new
# book.author = "Neil Stephenson"
# book.title = "Snow Crash"
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)

## Expected output:
## The author of "Snow Crash" is Neil Stephenson.
## book = "Snow Crash", by Neil Stephenson.

## 5. Fix the Program - Persons
## Complete this program so that it produces the expected output:

# class Person
#   attr_writer :last_name, :first_name

#   def initialize(first_name, last_name)
#     @first_name = first_name
#     @last_name = last_name
#   end

#   def to_s
#     "#{@first_name.capitalize} #{@last_name.capitalize}"
#   end
# end

# person = Person.new('john', 'doe')
# puts person

# person.first_name = 'jane'
# person.last_name = 'smith'
# puts person

## Expected output:
## John Doe
## Jane Smith

## 6. Fix the Program - Flight Data
## Consider the following class definition:

# class Flight
#   attr_accessor :database_handle

#   def initialize(flight_number)
#     @database_handle = Database.init
#     @flight_number = flight_number
#   end
# end

# There is nothing technically incorrect about this class, but the definition may lead to problems in the future.
# How can this class be fixed to be resistant to future problems?

## 7. Buggy Code - Car Mileage
## Fix the following code so it works properly.

# class Car
#   attr_accessor :mileage

#   def initialize
#     @mileage = 0
#   end

#   def increment_mileage(miles)
#     self.mileage = mileage + miles
#   end

#   def print_mileage
#     puts mileage
#   end
# end

# car = Car.new
# car.mileage = 5000
# car.increment_mileage(678)
# car.print_mileage  # should print 5678

## 8. Rectangles and Squares
## Given the following class:

# class Rectangle
#   def initialize(height, width)
#     @height = height
#     @width = width
#   end

#   def area
#     @height * @width
#   end
# end

# class Square < Rectangle
#   def initialize(length)
#     super(length, length)
#   end
# end

# ## Write a class called Square that inherits from Rectangle, and is used like this:

# square = Square.new(5)
# puts "area of square = #{square.area}"

## 9. Complete the Program - Cats!
## Consider the following program:

# class Pet
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
# end

# class Cat < Pet
#   attr_reader :name, :age, :color

#   def initialize(name, age, color)
#     super(name, age)
#     @color = color
#   end

#   def to_s
#     "My cat #{name} is #{age} years old and has #{color} fur."
#   end
# end

# pudding = Cat.new('Pudding', 7, 'black and white')
# butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
# puts pudding, butterscotch

## Update this code so that when you run it, you see the following output:
## My cat Pudding is 7 years old and has black and white fur.
## My cat Butterscotch is 10 years old and has tan and white fur.

## 10. Refactoring Vehicles
## Consider the following classes:
## Refactor these classes so they all use a common superclass, and inherit behavior as needed.

# class Vehicle
#   attr_reader :make, :model

#   def initialize(make, model)
#     @make = make
#     @model = model
#   end

#   def to_s
#     "#{make} #{model}"
#   end
# end

# class Car < Vehicle
#   def wheels
#     4
#   end
# end

# class Motorcycle < Vehicle
#   def wheels
#     2
#   end
# end

# class Truck < Vehicle
#   attr_reader :payload

#   def initialize(make, model, payload)
#     super(make, model)
#     @payload = payload
#   end

#   def wheels
#     6
#   end
# end