class DockingStation

	attr_accessor :bike_count

	def initialize
		@bike_count = 0
	end
	
	def dock(bike)
		
		@bike_count += 1 if bike

	end
end