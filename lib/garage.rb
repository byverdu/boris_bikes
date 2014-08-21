require_relative "errors"
require_relative "bike_container"

class Garage

	include BikeContainer
	
	def collect(bike)

		self.accept_bike(bike)

		raise CollectError.new('This is a working bike!!') unless  bike.broken? 

		bike.fix!
	end


end