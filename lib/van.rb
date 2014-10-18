require_relative "bike_container"

class Van

	include BikeContainer

	def move_to station_location
		self.location = station_location
	end

	def return_to garage_location
		self.location = garage_location
	end
end