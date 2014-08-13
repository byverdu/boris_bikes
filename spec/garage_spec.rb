require 'garage'
require 'bike_container_spec'

describe Garage do

	it_behaves_like "a bike container"
	let(:bike)   {Bike.new  }
	let(:garage) {Garage.new(:capacity => 10)}

	it "should fix bikes when receives a broken bike" do
		
		bike.break!
		garage.accept_bikes(bike)

		expect(bike).not_to be_broken
	end

	it "should have a initialized capacity" do

		expect(garage.capacity).to eq 10
	end
end