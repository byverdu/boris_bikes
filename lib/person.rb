class Person

	attr_accessor :name

	def initialize(bike=nil,name)
		@bike = bike
		@name = name
	end

	def has_bike?
		!@bike.nil?
	end 

	def falls_down!
		@bike.break!
	end

	def rent_from_station station
		@bike = station.release_working_bike
	end

	def return_bike station
		@bike.return_time
		station.accept_bike @bike 
		@bike = nil
	end

end
