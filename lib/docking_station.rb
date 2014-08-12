require_relative 'bike_container'

class DockingStation

	include BikeContainer # access to all methods

	def initialize(options={})
		
		self.capacity = options.fetch(:capacity,capacity)
	end

end