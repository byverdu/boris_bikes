class Bike

	attr_reader   :serial_number
	attr_accessor :rent_time, :return_time

	$bikes = []
	
	def serial_number_generator
		sn = ("A".."Z").to_a.sample(3).join
		indicative1 =(0..9).to_a.sample(3).join
		indicative2 =(0..9).to_a.sample(2).join
		indicative3 =(0..9).to_a.sample(5).join
		"#{sn} #{indicative1}-#{indicative2}-#{indicative3}" 
	end

	def initialize(serial_number: serial_number_generator)
		@broken        = false
		@serial_number = serial_number
	end

	def rent!
		@rent_time = Time.now.round(0)
	end

	def return!
		@return_time = Time.now.round(0)

		raise "You have to pay!" if  seconds_rented > 1800

	end

	def seconds_rented
		@return_time - @rent_time
	end

	def broken?
		@broken
	end

	def break!
		@broken = true
	end

	def fix!
		@broken = false
	end

	def store_serial_number
		$bikes << {:serial_number => @serial_number}
	end
end

