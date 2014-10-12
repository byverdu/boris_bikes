require './lib/person'

describe Person do 

	let(:bike)               { double :bike      }
	let(:broken_bike)        { double :bike , broken?: true   }
	let(:station)            { double :docking_station }

	let(:person_with_bike)   { Person.new(bike,'Albert') }

	it "has no bike" do
		person = Person.new('Albert')
		
		expect(person).not_to have_bike
	end

	it "can be initialized with a name" do
		person = Person.new('Albert')
		expect(person.name).to eq('Albert')
	end

	it "has a bike" do
		expect(person_with_bike).to have_bike
	end

	it "can break a bike" do
		#person = Person.new(bike)
		expect(bike).to receive(:break!).and_return(true)
		expect(bike).to receive(:broken?).and_return(true)
		person_with_bike.falls_down!
		expect(bike.broken?).to be true
	end

	it "can rent a bike from a docking station" do
		person = Person.new('Albert')
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

