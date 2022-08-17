## Question 1
## Which of the following are objects in Ruby? If they are objects, how can you find out what class they belong to?

# true
# "hello"
# [1, 2, 3, "happy days"]
# 142

## They are all objects in ruby and you can find out their class by invoking the #class method



## Question 2
## If we have a Car class and a Truck class and we want to be able to go_fast, how can we add the ability for them to go_fast using the module Speed?
## How can you check if your Car or Truck can now go fast?

# module Speed
#   def go_fast
#     puts "I am a #{self.class} and going super fast!"
#   end
# end

# class Car
#   def go_slow
#     puts "I am safe and driving slow."
#   end
# end

# class Truck
#   def go_very_slow
#     puts "I am a heavy truck and like going very slow."
#   end
# end

## We can add the ability for them to go fast by using the include method in class and the truck class => include Car, include Truck
## We can invoke the #go_fast method to check if the Car or Truck object can go fast.



## Question 3
## In the last question we had a module called Speed which contained a go_fast method. We included this module in the Car class as shown below.

# module Speed
#   def go_fast
#     puts "I am a #{self.class} and going super fast!"
#   end
# end

# class Car
#   include Speed
#   def go_slow
#     puts "I am safe and driving slow."
#   end
# end

## When we called the go_fast method from an instance of the Car class (as shown below) you might have noticed that the
## string printed when we go fast includes the name of the type of vehicle we are using. How is this done?

## This is done by calling the #class method on the object, in this case an instance of the Car class, it returns the type of object it is. 



## Question 4
## If we have a class AngryCat how do we create a new instance of this class?
## The AngryCat class might look something like this

# class AngryCat
#   def hiss
#     puts "Hisssss!!!"
#   end
# end

## We can invoke the #new method on the class, this will instatiate an object of that class
## AngryCat.new



## Question 5
## Which of these two classes has an instance variable and how do you know?

# class Fruit
#   def initialize(name)
#     name = name
#   end
# end

# class Pizza
#   def initialize(name)
#     @name = name
#   end
# end

## An instance variable is denoted by starting with the `@` symbol, therefore the Pizza class has an instance variable, and Fruit does not. 
## !!! We can also call the #instance_variables method and it will show us the instance variables associated with an object.



## Question 6
## What could we add to the class below to access the instance variable @volume?

## We can define a getter method, this is done in two ways:
## 1. We define a getter method, such as: def get_volume; @volume; end
## 2. We can include the attr_reader method and pass in :volume. This will create a getter method for us. 
## !!! or 3rd, we could do => instance_variable_get("@volume") on an instance.



## Question 7
## What is the default return value of to_s when invoked on an object? Where could you go to find out if you want to be sure?

## The default return value will be the name of the object followed by an encoding of the object id.
## You can find out through the ruby docs, or simply by invoking puts and passing in the object as an argument.



## Question 8
## If we have a class such as the one below:

# class Cat
#   attr_accessor :type, :age

#   def initialize(type)
#     @type = type
#     @age  = 0
#   end

#   def make_one_year_older
#     self.age += 1
#   end
# end

## You can see in the make_one_year_older method we have used self. What does self refer to here?

## self refers to the instance object



## Question 9
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

## In the name of the cats_count method we have a used self. What does self refer to in this context?

## the self refers to the Class, in this case Cat

## Question 10
## If we have the class below, what would you need to call to create a new instance of this class.

# class Bag
#   def initialize(color, material)
#     @color = color
#     @material = material
#   end
# end

## We would need to call the #new method on the class and pass in two arguments, the color and material