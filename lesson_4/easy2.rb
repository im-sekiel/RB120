## Question 1
## You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

## What is ther esult of executing the following code:

oracle = Oracle.new
oracle.predict_the_future

## One of the three
## You will eat a nice lunch
## You will take a nap soon
## You will stay at work late

## Question 2
## We have an Oracle class and a RoadTrip class that inherits from the Oracle class.

# class Oracle
#   def predict_the_future
#     "You will " + choices.sample
#   end

#   def choices
#     ["eat a nice lunch", "take a nap soon", "stay at work late"]
#   end
# end

# class RoadTrip < Oracle
#   def choices
#     ["visit Vegas", "fly to Fiji", "romp in Rome"]
#   end
# end

## What is the result of the following:
# trip = RoadTrip.new
# trip.predict_the_future

## One of the choices from Visit vegas, fly to Fiji, romp in Rome

## Question 3
## How do you find where Ruby will look for a method when that method is called? How can you find an object's ancestors?

# module Taste
#   def flavor(flavor)
#     puts "#{flavor}"
#   end
# end

# class Orange
#   include Taste
# end

# class HotSauce
#   include Taste
# end

## What is the lookup chain for Orange and HotSauce?

## You can find out the object's ancestors by invoking ancestors on the object
## Lookup chain => Orange > Taste > Object > Kernal > BasicObject
## Lookup chain => HotSauce > Taste > Object > Kernal > BasicObject

## Question 4
## What could you add to this class to simplify it and remove two methods from the class definition while still maintaining the same functionality?

# class BeesWax
#   def initialize(type)
#     @type = type
#   end

#   def type
#     @type
#   end

#   def type=(t)
#     @type = t
#   end

#   def describe_type
#     puts "I am a #{@type} of Bees Wax"
#   end
# end

## attr_accessor :type

## Question 5
## There are a number of variables listed below. What are the different types and how do you know which is which?

# excited_dog = "excited dog" #=> local variable
# @excited_dog = "excited dog" #=> instance variable, denoted by @ symbol
# @@excited_dog = "excited dog" #=> class variable, denoted by two @ symbol

## Question 6
## If I have the following class:

# class Television
#   def self.manufacturer
#     # method logic
#   end

#   def model
#     # method logic
#   end
# end

## Which one of these is a class method (if any) and how do you know? How would you call a class method?

## Television#manufacturer is a class method because it is prefixed with self
## You can call a class method by invoking manufacturer on the class itself => Television.manufacturer

## Question 7
## If we have a class such as the one below:

# class Cat
#   @@cats_count = 0

#   def initialize(type)
#     @type = type
#     @age  = 0
#     @@cats_count += 1
#   end

#   def self.cats_count
#     @@cats_count
#   end
# end

## Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?
## @@cats_count is a class variable and @@cats_count += 1 will incremenet the value by 1 everytime a Cat object is instantiated.
## We can use the #new method to instatiate a object of class Cat and call #cats_count to see the value 

## Question 8
## If we have this class:

# class Game
#   def play
#     "Start the game!"
#   end
# end

# ## And another class:

# class Bingo
#   def rules_of_play
#     #rules of play
#   end
# end

## What can we add to the Bingo class to allow it to inherit the play method from the Game class?
## we can < Game to the Bingo class

## Question 9
## If we have this class:

# class Game
#   def play
#     "Start the game!"
#   end
# end

# class Bingo < Game
#   def rules_of_play
#     #rules of play
#   end
# end

## What would happen if we added a play method to the Bingo class, keeping in mind that there is already a
## method of this name in the Game class that the Bingo class inherits from.

## When ruby traverses the class hierarchy it will first look for a method within the class, then look through the class it inherits from.
## Therefore, if we added a #play method to Bingo, it would execute that method, rather than the #play method in Game

## Question 10
## What are the benefits of using Object Oriented Programming in Ruby? Think of as many as you can.

## 1. Inheritance, Encapsulation, Polymorphism
## 2. Namespacing - organizing code
## 3. Makes it more dynamic
## 4. Makes code more legible

# Because there are so many benefits to using OOP we will just summarize some of the major ones:

# Creating objects allows programmers to think more abstractly about the code they are writing.
# Objects are represented by nouns so are easier to conceptualize.
# It allows us to only expose functionality to the parts of code that need it, meaning namespace issues are much harder to come across.
# It allows us to easily give functionality to different parts of an application without duplication.
# We can build applications faster as we can reuse pre-written code.
# As the software becomes more complex this complexity can be more easily managed.