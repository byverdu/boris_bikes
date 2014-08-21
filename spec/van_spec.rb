require 'van'
#require 'bike_container_spec' # only if we are testing a single file
describe Van do

	it_behaves_like "a bike container"

	let(:van) {Van.new}

	let(:working_bike) {double :bike, broken?: false}
	let(:broken_bike ) {double :bike, broken?: true }

	it "should" do


	end

end