## 1. Fix the Program - Mailable
## Correct the following program so it will work properly. Assume that the Customer and Employee classes have complete implementations;
## just make the smallest possible change to ensure that objects of both types have access to the print_address method.

# module Mailable
#   def print_address
#     puts "#{name}"
#     puts "#{address}"
#     puts "#{city}, #{state} #{zipcode}"
#   end
# end

# class Customer
#   include Mailable
#   attr_reader :name, :address, :city, :state, :zipcode
# end

# class Employee
#   include Mailable
#   attr_reader :name, :address, :city, :state, :zipcode
# end

# betty = Customer.new 
# bob = Employee.new
# betty.print_address
# bob.print_address

## 2. Fix the Program - Drivable
## orrect the following program so it will work properly. Assume that the Car class has a complete implementation;
## just make the smallest possible change to ensure that cars have access to the drive method.

# module Drivable
#   def drive
#   end
# end

# class Car
#   include Drivable
# end

# bobs_car = Car.new
# bobs_car.drive

## 3. Complete The Program - Houses
## Assume you have the following code:

# class House
#   include Comparable
#   attr_reader :price

#   def initialize(price)
#     @price = price
#   end

#   def <=>(other)
#     price <=> other.price
#   end
# end

# home1 = House.new(100_000)
# home2 = House.new(150_000)
# puts "Home 1 is cheaper" if home1 < home2
# puts "Home 2 is more expensive" if home2 > home1

## and this output:
## Home 1 is cheaper
## Home 2 is more expensive
## Modify the House class so that the above program will work. You are permitted to define only one new method in House.

## 4. Reverse Engineering
## Write a class that will display:

## ABC
## xyz

# class Transform
#   def initialize(data)
#     @data = data
#   end

#   def uppercase
#     data.upcase
#   end

#   def self.lowercase(string)
#     string.downcase
#   end

#   private

#   attr_reader :data
# end

## when the following code is run:

# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ')

## 5. What WIll This Do?
## What will the following code print?

# class Something
#   def initialize
#     @data = 'Hello'
#   end

#   def dupdata
#     @data + @data
#   end

#   def self.dupdata
#     'ByeBye'
#   end
# end

# thing = Something.new
# puts Something.dupdata # => "ByeBye"
# puts thing.dupdata # => "HelloHello"

## 6. Comparing Wallets
## Consider the following broken code:

# class Wallet
#   include Comparable

#   def initialize(amount)
#     @amount = amount
#   end

#   def <=>(other_wallet)
#     amount <=> other_wallet.amount
#   end

#   protected

#   attr_reader :amount
# end

# bills_wallet = Wallet.new(500)
# pennys_wallet = Wallet.new(465)
# if bills_wallet > pennys_wallet
#   puts 'Bill has more money than Penny'
# elsif bills_wallet < pennys_wallet
#   puts 'Penny has more money than Bill'
# else
#   puts 'Bill and Penny have the same amount of money.'
# end

## 7. Pet Shelter
## Modify this code so it works. Do not make the amount in the wallet accessible to any method that isn't part of the Wallet class.
## Consider the following code:

# class Pet
#   attr_reader :type, :name

#   def initialize(type, name)
#     @type = type
#     @name = name
#   end
# end

# class Owner
#   attr_reader :name
#   attr_accessor :number_of_pets

#   def initialize(name)
#     @name = name
#     @number_of_pets = 0
#   end
# end

# class Shelter
#   def initialize
#     @list = {}
#   end

#   def adopt(owner, pet)
#     owner.number_of_pets += 1

#     if list[owner.name] == nil
#       list[owner.name] = []
#       list[owner.name] << [pet.type, pet.name]
#     else
#       list[owner.name] << [pet.type, pet.name]
#     end
#   end

#   def print_adoptions
#     list.each do |owner, pets|
#       puts "#{owner} has adopted the following pets:"
#       pets.each do |array|
#         puts "a #{array[0]} named #{array[1]}"
#       end
#     end
#   end

#   private

#   attr_reader :list
# end

# butterscotch = Pet.new('cat', 'Butterscotch')
# pudding      = Pet.new('cat', 'Pudding')
# darwin       = Pet.new('bearded dragon', 'Darwin')
# kennedy      = Pet.new('dog', 'Kennedy')
# sweetie      = Pet.new('parakeet', 'Sweetie Pie')
# molly        = Pet.new('dog', 'Molly')
# chester      = Pet.new('fish', 'Chester')

# phanson = Owner.new('P Hanson')
# bholmes = Owner.new('B Holmes')

# shelter = Shelter.new
# shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# shelter.print_adoptions
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

## 8. Moving
## You have the following classes.
# module Walkable
#   def walk
#     puts "#{name} #{gait} forward."
#   end
# end

# class Person
#   include Walkable
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "strolls"
#   end
# end

# class Cat
#   include Walkable
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "saunters"
#   end
# end

# class Cheetah
#   include Walkable
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   private

#   def gait
#     "runs"
#   end
# end

# ## You need to modify the code so that this works:
# ## You are only allowed to write one new method to do this.


# mike = Person.new("Mike")
# mike.walk
# # => "Mike strolls forward"

# kitty = Cat.new("Kitty")
# kitty.walk
# # => "Kitty saunters forward"

# flash = Cheetah.new("Flash")
# flash.walk
# # => "Flash runs forward"

## 9. Nobility
## Now that we have a Walkable module, we are given a new challenge. Apparently some of our users are nobility, and the regular way of walking simply isn't good enough.
## Nobility need to strut.
## We need a new class Noble that shows the title and name when walk is called:

module Walkable
  def walk
    "#{self} #{gait} forward."
  end
end

class Noble
  include Walkable

  def initialize(name, title)
    @name = name
    @title = title
  end

  def name
    "#{@title} #{@name}"
  end
  
  private

  def gait
    "struts"
  end
end

byron = Noble.new("Byron", "Lord")
puts byron.walk
# => "Lord Byron struts forward"