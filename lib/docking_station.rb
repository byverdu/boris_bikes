require_relative 'errors' 
require_relative 'bike_container'

class DockingStation

	include BikeContainer

	def release_working_bike
		actual_bike = list_working_bikes.pop

		actual_bike.rent_at 

		actual_bike

	end
end


