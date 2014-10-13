# BorisBikes

Barclays Cycle Hire is a public bicycle hire scheme in London, United Kingdom. The scheme's bicycles are popularly known as Boris Bikes, after Boris Johnson, who was the Mayor of London when the scheme was launched.

The scheme will keep track of a number of docking stations and the bikes. It will allow users to rent the bikes and return them. Occasionally the bikes will break and then they will be unavailable for rental. There will also be a garage to fix the bikes and a van to move the bikes between the stations and the garage.

### Objectives

1. Use Object-Oriented Design (OOD) and Object-Oriented Programming (OOP).
1. Create a domain model.
1. Use of CRC card (Class-Responsibility-Collaboration).
1. Test using RSpec.
1. Interaction between different classes.


### Technologies used

1. Ruby
1. RSpec

### How to run the tests

```ruby
> git clone https://github.com/byverdu/boris_bikes.git

> cd boris_bikes

> rspec -fd
```


### How to use it

```ruby
> git clone https://github.com/byverdu/boris_bikes.git

> cd boris_bikes

> irb

> require './lib/loader'
```

### All available classes

```ruby
albert     = Person.new('Albert')
bike       = Bike.new
van        = Van.new
old_street = DockingStation.new
victoria   = Garage.new
```

### Possible methods Bike

```ruby
# Person.new(name)
Person.has_bike? # true or false

Person.rent_from_station station 

Person.falls_down! # breaks bike

Person.return_bike station 
```

### Possible methods Person

```ruby
# Bike.new

Bike.broken? # false

Bike.serial_number # "HFU 623-98-89230"

Bike.break! # broken = true
Bike.fix!   # broken = false

Bike.rent!   # @rent_time
Bike.return! # @return_time
```

### Possible methods for module BikeContainer

```ruby

# Common functionality for:
# DockingStation, Garage, Van



```





