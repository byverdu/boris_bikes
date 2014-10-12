#require 'bike_container_spec' # only if we are testing a single file
require 'docking_station'

describe DockingStation do


	it_behaves_like 'a bike container'

	let(:station)         { DockingStation.new}
	let(:working_bike)    { double :bike, broken?: false }
	let(:broken_bike)     { double :bike, broken?: true}


	it 'should not release a broken bike to a person' do
		expect(working_bike).to receive(:rent_time)

		expect(station.count_bikes).to eq(0)
		
		station.accept_bike broken_bike
		station.accept_bike working_bike
		
		expect(station.count_bikes).to eq(2)
		expect(station.release_working_bike).to eq working_bike
		expect(station.count_bikes).to eq(1)
	end

	it "should raise an error if there is not a working bike" do
		expect(station.count_bikes).to eq(0)
		
		station.accept_bike broken_bike
		expect(station.count_bikes).to eq(1)

		expect{ station.release_working_bike }.to raise_error(RuntimeError,'There is no working bikes!')

	end



end






