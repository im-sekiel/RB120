# Exercises
# 1. How do we create an object in Ruby? Give an exmaple of the creation of an object.
word = String.new #<- This was my example, guess I'm wrong

class Dog
end

luna = Dog.new


# 2. What is a module? What is its purpose? How do we use them with our classes? Create a module for the class you created in exercise 1 and include it properly.
# A module is a collection of behaviors
# It's purpose is that it can be used in other classes via mixins, using the include method invocation

module Speak
  def speak(sound)
    "#{sound}"
  end
end

class Dog
  include Speak
end
