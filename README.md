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

### Possible methods Person

```ruby
# Person.new(name)
Person.has_bike? # true or false

Person.rent_from_station station 

Person.falls_down! # breaks bike

Person.return_bike station 
```

### Possible methods Bike

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

self.count_bikes

self.get_empty 

self.accept_bike bike

self.release_bike bike

self.list_working_bikes

self.list_broken_bikes

self.full?

```
##### DockingStation methods

```ruby
DockingStation.release_working_bike
```

##### Garage methods

```ruby
Garage.collect bike # calls bike.fix!
```

##### Van methods

```ruby
Van.move_to station_location
Van.return_to garage_location
```

## Demo user interaction

```ruby
al            = Person.new('Albert')
regent_street = DockingStation.new(location: 'Regents Street')
old_street    = DockingStation.new(location: 'Old Street')
garage        = Garage.new(location: 'Victoria')
van           = Van.new(location: 'Victoria')
bike          = Bike.new()

regent_street.accept_bike bike

al.rent_from_station regent_street

al.falls_down! # calls bike.break!

al.return_bike old_street

van.move_to old_street

van.release_bike bike

van.return_to garage # calls bike.fix!
```








