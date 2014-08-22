require_relative "bike_container"

class Van

	include BikeContainer

	def move_to station_location
		self.location = station_location
	end

end