require_relative 'errors' 

module BikeContainer

	BROKEN_BIKES     = Proc.new{ |bike| bike.broken? }

	DEFAULT_CAPACITY = 20

	attr_reader :bikes, :capacity

	def initialize(bikes: [], capacity: DEFAULT_CAPACITY)
		@bikes    = bikes
		@capacity = capacity
	end

	def count_bikes 
		@bikes.count
	end

	def accept_bike bike

		raise ReachCapacityError.new("The #{self.class} is full") if full?
		raise BikeInclusionError.new("The #{bike} already exists") if @bikes.include?(bike)
		#raise IdentityError.new("Only bikes accepted, #{self.class} not allowed") unless bike.class != Bike
		
		@bikes << bike
	end

	def release_bike bike

		raise EmptyBoxError.new("No bikes to release") unless @bikes.include?(bike)

		@bikes.delete(bike)
	end
	
	def list_working_bikes 
		@bikes.reject(&BROKEN_BIKES)
	end

	def list_broken_bikes
		@bikes.select(&BROKEN_BIKES)
	end

	def full?
		count_bikes == @capacity
	end

end