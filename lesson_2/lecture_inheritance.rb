## 1. Given the class:
## Create a sub-class from Dog called Bulldog overriding the swim method to return "can't swim!"

# class Dog
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end
# end

# class Bulldog < Dog
#   def swim
#     "can't swim!"
#   end
# end

# teddy = Dog.new
# puts teddy.speak           # => "bark!"
# puts teddy.swim           # => "swimming!"

# ted = Bulldog.new

# puts ted.swim

## 2. Let's create a few more methods for our Dog class
## Create a new class called Cat, which can do everything a dog can, except swim or fetch.
## Assume the methods do the exact same thing. Hint: don't just copy and paste all methods in Dog into Cat; try to come up with some class hierarchy.
# class Pet
#   def run
#     'running!'
#   end

#   def jump
#     'jumping!'
#   end
# end

# class Dog < Pet
#   def speak
#     'bark!'
#   end

#   def fetch
#     'fetching!'
#   end

#   def swim
#     'swimming!'
#   end
# end

# class Cat < Pet
#   def speak
#     'meow!'
#   end
# end

## 3. Draw a class hierarcy diagraom of classes from step # 2
=begin

          Pet
          -run
          -jump
        /     \
      Dog     Cat
      -speak  -speak
      -fetch
      -swun
=end

## 4. What is a method lookup path and how is it importnat?
=begin  
Method lookup path is the way a method in 'fetched' when invoked. It first looks through the class, and if it doesn't find it there, it goes to other classes (depending on the hierarchy).
It's important to know because different classes can have the same method name, but they return different values
=end