require './lib/person'

describe Person do 

	let(:bike)               { double :bike      }
	let(:broken_bike)        { double :bike , broken?: true   }
	let(:station)            { double :docking_station }

	let(:person_with_bike)   { Person.new(bike) }

	it "has no bike" do
		person = Person.new
		
		expect(person).not_to have_bike
	end

	it "has a bike" do
		expect(person_with_bike).to have_bike
	end

	it "can break a bike" do
		#person = Person.new(bike)
		expect(bike).to receive(:break!)
		person_with_bike.falls_down!
	end

	it "can rent a bike from a docking station" do
		person = Person.new
		expect(station).to receive(:release_working_bike).and_return(bike)

		person.rent_from_station station

		expect(person).to have_bike
 	end

 	it "can return the bike to the docking station" do
 		allow(station).to receive(:accept_bike)

 		person_with_bike.return_bike station

 		expect(person_with_bike).not_to have_bike
 	end
end

