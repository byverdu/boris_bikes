require "docking_station"
#require 'bike_container_spec' # only if we are testing a single file
describe(DockingStation) do

	it_behaves_like "a bike container"
	let(:station) {DockingStation.new(:capacity => 10)}

	it "should allow setting default capacity initialising" do
		expect(station.capacity).to eq(10)
	end
end

