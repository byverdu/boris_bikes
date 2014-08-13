require 'bike'
require 'bike_container'

shared_examples "a bike container" do

	def fill_station(station)
		station.capacity.times{station.dock(Bike.new)}
	end

	let(:bike)   {Bike.new           }
	let(:station) {described_class.new}

	it "should accept a bike" do
		# we expect the station to have 0 bikes
		expect(station.bike_count).to eq(0)
		
		station.dock(bike)

		expect(station.bike_count).to eq(1)
	end

	it "should release a bike" do

		station.dock(bike)

		station.release_a_bike(bike)

		expect(station.bike_count).to eq(0)
	end

	it "should know when it's full" do

		expect(station.full?).to be false

		fill_station station

		expect(station.full?).to be true
	end

	it "should not accept a bike if it's full" do

		fill_station station

		expect{station.dock(bike)}.to raise_error(RuntimeError)
	end

	it "should provide a list of all available bikes" do
		
		working_bike, broken_bike = Bike.new, Bike.new
		
		broken_bike.break!

		station.dock(working_bike)
		station.dock(broken_bike)

		expect(station.available_bikes).to eq([working_bike])
	end
end