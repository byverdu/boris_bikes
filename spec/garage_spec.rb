#require 'bike_container_spec' # only if we are testing a single file
require "garage"

describe Garage do

	it_behaves_like "a bike container"

	let(:garage)   { Garage.new   }
	let(:bike)     { double :bike }

	it "should not accept a working bike" do
		expect(bike).to receive(:broken?)
		expect{garage.collect(bike)}.to raise_error(CollectError)
	end

	it "should fix a broken bike when receives one" do 
		allow(bike).to receive(:broken?).and_return(true)
		allow(bike).to receive(:fix!)

		garage.collect(bike)

		bike.fix!
		#expect(bike.broken?).to be false
	end
end