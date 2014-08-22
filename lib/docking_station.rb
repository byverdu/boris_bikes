require_relative 'errors' 
require_relative 'bike_container'

class DockingStation

	#attr_reader :location

	include BikeContainer

	# def initialize(location:) # How to add more instance variables before module initializes
	# 	super
	# 	@location = location
	# 	#BikeContainer.initialize
	# end

		# def initialize(bikes: [], capacity: DEFAULT_CAPACITY)
		# 	@bikes    = bikes
		# 	@capacity = capacity
		# 	@location = location
		# end


	def release_working_bike
		list_working_bikes
	end
end


