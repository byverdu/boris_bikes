require 'bike_container'

shared_examples "a bike container" do

	def fill_station(station)
		holder.capacity.times{holder.dock(Bike.new)}
	end

	let(:bike) {Bike.new}
	let(:holder) {DockingStation.new}

	it "should accept a bike" do

		# we expect the holder to have 0 bikes
		expect(holder.bike_count).to eq(0)
		
		holder.dock(bike)

		expect(holder.bike_count).to eq(1)
	end

	it "should release a bike" do

		holder.dock(bike)

		holder.release_a_bike(bike)

		expect(holder.bike_count).to eq(0)
	end

	it "should know when it's full" do

		expect(holder.full?).to be false

		fill_station holder

		expect(holder.full?).to be true
	end

	it "should not accept a bike if it's full" do

		fill_station holder

		expect{holder.dock(bike)}.to raise_error(RuntimeError)
	end

	it "should provide a list of all available bikes" do
		
		working_bike, broken_bike = Bike.new, Bike.new
		
		broken_bike.break!

		holder.dock(working_bike)
		holder.dock(broken_bike)

		expect(holder.available_bikes).to eq([working_bike])
	end
end