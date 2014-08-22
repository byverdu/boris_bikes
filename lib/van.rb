require_relative "bike_container"

class Van

	include BikeContainer

	# def initialize(options={})
	# 	@moving = false
	# 	super(options)
	# end

	# def moving!
	# 	@moving = true
	# end

	# def stoped!
	# 	@moving  
	# end

	def move_to station_location
		self.location = station_location
	end

	def return_to garage_location
		self.location = garage_location
	end



end