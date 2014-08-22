#require 'bike_container_spec' # only if we are testing a single file
require 'docking_station'



describe DockingStation do

	it_behaves_like 'a bike container'

	let(:station)         { DockingStation.new}
	let(:working_bike)    { double :bike, broken?: false }
	let(:broken_bike)     { double :bike, broken?: true}

	it 'should not release a broken bike to a person' do
		station.accept_bike broken_bike
		station.accept_bike working_bike

		expect(station.release_working_bike ).to eq [working_bike]
	end
end






