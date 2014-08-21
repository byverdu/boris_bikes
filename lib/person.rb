class Person

	def initialize bike=nil
		@bike = bike
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
		station.accept_bike
		@bike = nil
	end

end
