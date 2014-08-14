require_relative 'bike_container'

class Person

	def initialize(bike: nil)
		@bike = bike
	end

	def has_bike?
		!@bike.nil?
	end

	def rent_bike_from station
		@bike = station.release_a_bike	
	end

=begin
def return_bike_to station
		station.dock(@bike)
	end
=end

end