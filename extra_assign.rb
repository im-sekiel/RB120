=begin

I wanted to go over what encapsulation is in OOP. My previous understand of Encapsulation was that it was a way of data protection within OOP. Now how did we achieve this
data protection in OOP? My previous understanding was that data protection was achieved by method access control. So, I had originally thought method access control composed
about 80% of what encapsulation was. 

While this is was not entirely wrong, it's was not necessarily right.

So, what is encapsulation?

Simply, encapsulation in OOP is done through the grouping of data into objects while making that data unavailable to other parts of a codebase.

  - That data that we're hiding is the attributes and functionality that an object has.
    - Therefore we are hiding data from the rest of the codebase which makes it inaccessible from the rest of the program. 
      - This also protects that data from unintentional manipulation.

Take for example:

class Car
  def initialize(model, year, color)
    @model = model
    @year = year
    @color = color
  end
end


my_car = Car.new('toyota', 2020, 'white')



So, this should be familiar to us. And it should already be clear that at this point in the code we have instatiated an object. Now, the moment we create an object
is the moment encapsulation takes place. How can we prove that?

Well, if we run the following:

=end

class Car
  def initialize(model, year, color)
    @model = model
    @year = year
    @color = color
  end
end


my_car = Car.new('toyota', 2020, 'white')

puts my_car.inspect

=begin 
We can see that invoking the inspect method on my_car shows us that the data that was passed as arguments has been encapsulated into the object that local variable
my_car references. 

Now I mentioned earlier that when encaspulation occurs, we also make that data unavialable to the rest of the codebase. How can we prove this?
Well let's try to reference that data that is encaspulated within the object and see what happens.

=end

p @model

=begin 
As we can see that data is unavailable for us from the rest of the codebase. This also demonstrated that we cannot interact with an object unless we explicitly 
expose the state and behaviours of that object to other parts of our code. In other words, we need to set getter and setter methods to interact with that data.
We're familiar with those methods, so for that reason I won't get into the details of that here. 

So, how does method access control relate and tie into encaspulation?

Simply put, method access control is a tool that helps us in hiding or exposing behavior encapsulated in an object. In other words, method access control helps us fine tune what 
behaviors are hidden and exposed to the rest of the codebase. 

Let's take our previous example to show this behavior

We're going to add getter methods to it, which allows some of the data to be exposed.

=end

class Car
  attr_reader :model, :year, :color, :auto_pilot

  def initialize(model, year, color)
    @model = model
    @year = year
    @color = color
    @auto_pilot = false
  end

  def start_auto_pilot
    connect_to_service
    gps_location
    auto_pilot_on
  end

  private

  def connect_to_service
    #code here
  end

  def gps_location
    #code_here
  end

  def auto_pilot_on
    #code here
  end
end


my_car = Car.new('tesla', 2022, 'white')

my_car.gps_location

=begin 
making 3 methods in this class private prevents it from being unintentionally manipulated. The following behaviors are not important outside the object, and therefore shouldn't
be exposed, but they are crucial in the behavior of starting auto pilot. Therefore, we make those behaviors private so it's only accessible to start_auto_pilot. 

Now what happens when we try to invoke one of those methods private methods?

We will be prevented from accessing it. 

=end