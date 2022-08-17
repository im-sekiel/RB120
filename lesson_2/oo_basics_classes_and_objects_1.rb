## 1.Find the Class

## Update the following code so that, instead of printing the values, each statement prints the name of the class to which it belongs.

# puts "Hello".class   #=> String
# puts 5.class         #=> Integer
# puts [1, 2, 3].class #=> Array

## 2. Create the Class
## Create an empty class named Cat

# class Cat

# end

## 3. Create the Object
## Using the code from the previous exercise, create an isntance of Cat and assign it to variable named kitty.

# kitty = Cat.new

## 4. What Are You?
## Using the code from the previous exercise, add an #intialize method that prints "I'm a cat!" when a new Cat object is initialized

# class Cat
#   def initialize
#     puts "I'm a cat!"
#   end
# end

# kitty = Cat.new

## 5. Hello, Sophie! (Part 1)
## Using the code from the previous exercise, add a parameter to #initialize that provides a name for the Cat object. Use an instance variable to print a greeting with the provided name.
## (You can remove the code that displauys "I'm a cat!")

# class Cat
#   def initialize(name)
#     @name = name
#     puts "Hello! My name is #{@name}!"
#   end
# end

# kitty = Cat.new("Sophia")

## 6. Hello, Sophia! (Part 2)
## Using the code from the previous exercise, move the greeting from the #initialize method to an instance method named #greet that prints a greeting when invoked.

# class Cat
#   def initialize(name)
#     @name = name
#   end

#   def greet
#     puts "Hello! My name is #{@name}!"
#   end
# end

# kitty = Cat.new("Sophia")
# kitty.greet

## 7. Reader
## Using the code from the previous exercise, add a getter method named #name and invoke it in place of @name in #greet.

# class Cat
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def greet
#     puts "Hello! My name is #{name}!"
#   end
# end

# kitty = Cat.new('Sophie')
# kitty.greet

## 8. Writer
## Using the code from the previous exercise, add a setter method named #name=. Then, rename kitty to 'Luna' and invoke #greet again.

# class Cat
#   attr_reader :name
#   attr_writer :name

#   def initialize(name)
#     @name = name
#   end

#   def greet
#     puts "Hello! My name is #{name}!"
#   end
# end

# kitty = Cat.new('Sophie')
# kitty.greet
# kitty.name = "Luna"
# kitty.greet

## 9. Accessor
## Using the code from the previous exercise, replace the getter and setter methods using Ruby shorthand.

# class Cat
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def greet
#     puts "Hello! My name is #{name}!"
#   end
# end

# kitty = Cat.new('Sophie')
# kitty.greet
# kitty.name = "Luna"
# kitty.greet

## 10. Walk the Cat
## Using the following code, create a module named Walkable that contains a method named #walk. This method should print Let's go for a walk! when invoked. Include Walkable in 
## Cat and invoke #walk on kitty.

# module Walkable
#   def walk
#     puts "Let's go for a walk!"
#   end
# end

# class Cat
#   include Walkable
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def greet
#     puts "Hello! My name is #{name}!"
#   end
# end

# kitty = Cat.new('Sophie')
# kitty.greet
# kitty.walk
