require 'person'

describe Person do

	#	let(:person) {}
		
	it "has no bike" do
		person = Person.new
		expect(person.has_bike?).to be false
	end

	it "can have a bike" do
		person = Person.new(:bike => :bike)
		expect(person).to have_bike
	end

	it "can rent a bike from station" do 
		person = Person.new

		old_street = double :station
		bike       = double :bike

		expect(old_street).to receive(:release_a_bike).and_return(bike)

		person.rent_bike_from old_street
	end

	it "has a bike after renting one" do
		person = Person.new

		bike 			 = double :bike
		old_street = double :station, :release_a_bike => bike

		person.rent_bike_from old_street

		expect(person).to have_bike
	end

	it "can return a bike to the station" do

	end

end