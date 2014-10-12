require_relative 'errors' 
require_relative 'bike_container'

class DockingStation

	include BikeContainer

	def release_working_bike

		raise "There is no working bikes!" unless list_working_bikes.any?
		
		actual_bike = list_working_bikes.pop

		actual_bike.rent_time 

		@bikes.pop

		actual_bike
	end
end


