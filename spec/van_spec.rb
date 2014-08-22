require 'van'
#require 'bike_container_spec' # only if we are testing a single file
describe Van do

	it_behaves_like "a bike container"

	let(:van) {Van.new}

	let(:garage)       { double :garage              }
	let(:station)      { double :station             }
	let(:working_bike) {double  :bike, broken?: false}
	let(:broken_bike ) {double  :bike, broken?: true }

	it "should be initialized on garage location" do
		garage = double :garage, location: 'old_street'

		van.location = garage.location

		expect(van.location).to eql(garage.location)
	end

	it "should be able to move to the docking station" do
		station = double :station, location: 'cedarne_road'
		van     = Van.new(location: "old_street")
		
		van.move_to station.location

		expect(van.location).to eql(station.location)
	end

	it "should be able to return to the garage" do
		station = double :station, location: 'cedarne_road'
		garage  = double :garage,  location: 'old_street'
		van     = Van.new(location: "old_street")

		van.move_to station.location

		van.return_to garage.location

		expect(van.location).to eql(garage.location)
	end
end