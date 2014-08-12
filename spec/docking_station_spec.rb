require "docking_station"

describe DockingStation do

	let(:station) {DockingStation.new(:capacity => 120)}

	it "Should allow setting default capacity initialising" do
		expect(station.capacity).to eq(120)
	end
end



