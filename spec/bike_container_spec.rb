require 'bike_container'

shared_examples 'a bike container' do

	let(:container)       { described_class.new } # described_class is our model class
	let(:working_bike)    { double :bike, broken?: false }
	let(:broken_bike)     { double :bike, broken?: true}

	def fill_container container
		container.capacity.times{container.accept_bike(Bike.new)}
	end

	context "should be initialized when class is created" do

		it "has no bikes when is initialized" do
			expect(container.bikes).to eql []
		end

		it "should have a default capacity" do
			expect(container.capacity).to eq 20
		end

		it 'can be set to have a custom capacity' do
			container = described_class.new(capacity: 30)
			expect(container.capacity).to eq 30
		end

		it "should set the location when is initialized" do
			station = described_class.new(location: 'old_street')
			expect(station.location).to eq('old_street')
		end
	
	end

	context "action methods" do

		it "should be able to dock a bike" do
			container.accept_bike working_bike

			expect(container.count_bikes).to eql 1
		end

		it "should be able to release a bike" do
			container.accept_bike working_bike		

			container.release_bike working_bike

			expect(container.count_bikes).to eql 0
		end

	end

	context "query methods" do

		it "should know how many bikes contains" do
			container.accept_bike working_bike
				
			expect(container.count_bikes).to eql 1
		end

		it "should be able to give a list of all working bikes" do
			container.accept_bike working_bike
			container.accept_bike broken_bike

			expect(container.list_working_bikes).to eq([working_bike])
		end

		it "should be able to give a list of all broken bikes" do
			container.accept_bike working_bike
			container.accept_bike broken_bike

			expect(container.list_broken_bikes).to eq([broken_bike])
		end

		it "should know when it is full" do
			fill_container container

			expect(container.full?).to be(true)
		end

		it "should be able to be empty" do
			fill_container container

			container.get_empty

			expect(container.count_bikes).to eql 0
		end

	end
	
	context "testing all common errors" do

		it "should not accept a bike when is full" do
			fill_container container

			expect{container.accept_bike(working_bike)}.to raise_error(ReachCapacityError)
		end

		it "should not release a bike if the container is empty" do
			expect(container.count_bikes).to eq 0

			expect { container.release_bike(working_bike) }.to raise_error(EmptyBoxError)
		end

		it "should not accept a bike twice" do
			container.accept_bike(working_bike)

			expect(container.count_bikes).to eq 1

			expect{container.accept_bike(working_bike) }.to raise_error(BikeInclusionError)
		end

		xit "should only accept bikes" do
			expect{ container.accept_bike(container) }.to raise_error(IdentityError)
			expect( container.accept_bike(working_bike)).to eq 1
		end
end


end