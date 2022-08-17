## Problem 1
## Given the below usage of the Person class, code the class definition

# class Person
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end
# end

# bob = Person.new('bob')
# bob.name                  # => 'bob'
# bob.name = 'Robert'
# bob.name                  # => 'Robert'

## Problem 2 
## Modify the class definition from above to facilitate the following methods. Note that there is no name= setter method now.

# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(full_name)
#     parts = full_name.split
#     @first_name = parts.first
#     @last_name = parts.size > 1 ? parts.last : ''
#   end

#   def name
#     "#{first_name} #{last_name}".strip
#   end
# end

# bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'

## Problem 3
## Now create a smart name= method that can take just a first name or a full name, and knows how to set the first_name and last_name appropriately. 

# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(full_name)
#     parts = full_name.split
#     @first_name = parts.first
#     @last_name = parts.size > 1 ? parts.last : ''
#   end

#   def name
#     "#{first_name} #{last_name}".strip
#   end

#   def name=(name)
#     parts = name.split
#     @first_name = parts.first
#     @last_name = parts.size > 1 ? parts.last : ''
#   end
# end

# bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'

# bob.name = "John Adams"
# p bob.first_name            # => 'John'
# p bob.last_name             # => 'Adams'

## Problem 4
## Using the class definition from step #3, let's create a few more people - that is, Person objects.

# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(full_name)
#     parts = full_name.split
#     @first_name = parts.first
#     @last_name = parts.size > 1 ? parts.last : ''
#   end

#   def name
#     "#{first_name} #{last_name}".strip
#   end

#   def name=(name)
#     parts = name.split
#     @first_name = parts.first
#     @last_name = parts.size > 1 ? parts.last : ''
#   end
# end

# bob = Person.new('Robert Smith')
# rob = Person.new('Robert Smith')

## If we're trying to determine whether the objects contain the same name, how can we compare the two objects?

# p bob.name == rob.name

## Continuing with our Person class definition, what does the below print out?

# bob = Person.new("Robert Smith")
# puts "The person's name is: #{bob}"

## It should just output the space in memory bob object resides in

## Let's add a to_s method to the class:

class Person
    attr_accessor :first_name, :last_name

  def initialize(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(name)
    parts = name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end

  def to_s
    name
  end
end

## Now what does the below output?

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

## Should output the getter method to_s, which would return the value of invoking the name getter method, which returns @name

