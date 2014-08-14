require 'garage'
#require 'bike_container_spec' # only if we are testing a single file
describe Garage do

	it_behaves_like "a bike container"
	let(:bike)   {Bike.new  								 }
	let(:garage) {Garage.new(:capacity => 10)}

	context "interaction with van" do

		it "should be able to accept bikes" do
			bike
		end

		it "should fix bikes when receives a broken bike" do
		
			bike.break!
			garage.collect(bike)

			expect(bike).not_to be_broken
			expect(garage.bikes).to eq [bike]
	end

	end



	it "should have a initialized capacity" do

		expect(garage.capacity).to eq 10
	end
end