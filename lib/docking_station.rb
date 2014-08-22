require_relative 'errors' 
require_relative 'bike_container'

class DockingStation

	include BikeContainer

	def release_working_bike
		list_working_bikes
	end
end


