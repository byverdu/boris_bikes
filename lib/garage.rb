require_relative 'bike_container'

class Garage

	include BikeContainer

	def initialize(options = {})
			
			self.capacity = options.fetch(:capacity, capacity)
	end

	alias_method :collect, :dock  

	def collect(bike)
		
		bikes << bike
		
		bike.fix!
	end

	

end