require "docking_station"

describe DockingStation do

	def fill_station(station)
		20.times {station.dock(Bike.new)}
	end

	let(:bike) {Bike.new}
	let(:station) {DockingStation.new(:capacity => 20)}

	it "should accept bikes" do

		expect(station.bike_count).to eq(0)

		station.dock(bike)
		
		expect(station.bike_count).to eq(1)
	end

	it "should release a bike" do

		station.dock(bike)

		station.release(bike)

		expect(station.bike_count).to eq(0)
	end

	it "should know when it's full" do

		expect(station.full?).to be false

		fill_station station

		expect(station.full?).to be true
	end

	it "should not accept a bike if it's full" do

		fill_station station

		expect(lambda{station.dock(bike)}).to raise_error(RuntimeError)
	end
end



