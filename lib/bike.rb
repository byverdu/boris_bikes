class Bike

	attr_reader :serial_number
	
	def serial_number_generator
		sn = ("A".."Z").to_a.sample(3).join
		indicative1 =(0..9).to_a.sample(3).join
		indicative2 =(0..9).to_a.sample(2).join
		indicative3 =(0..9).to_a.sample(5).join
		"#{sn} #{indicative1}-#{indicative2}-#{indicative3}" 
	end

	def initialize(serial_number: serial_number_generator)
		@broken = false
		@serial_number = serial_number
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
end