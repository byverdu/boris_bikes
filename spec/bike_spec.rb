require 'bike'

describe Bike do

	let(:bike){Bike.new}

	it "should not be broken after we create it" do
		expect(bike.broken?).to eq false
	end

	it "should be able to break" do
		bike.break!
		expect(bike.break!).to eq true
	end

	

end