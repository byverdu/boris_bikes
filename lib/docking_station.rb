require_relative 'errors' 
require_relative 'bike_container'

class DockingStation

	#attr_reader :location

	include BikeContainer

	def release_working_bike
		list_working_bikes
	end
end



	# def initialize(location) # How to add more instance variables before module initializes
	# 	@location = location
	# 	#BikeContainer.initialize
	# end