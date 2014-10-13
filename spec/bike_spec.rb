require 'bike'
require 'Timecop'

describe Bike do

	let(:bike)    { Bike.new }
	let(:station) { double :station  }

	it 'should not be broken after we create it' do
		expect(bike).not_to be_broken
	end

	it "should be able to break" do
		bike.break!
		
		expect(bike).to be_broken
	end

	it "should be fixed after is broken" do
		bike.break!
		bike.fix!
		
		expect(bike).not_to be_broken
	end

	it "can have a default serial number" do
    expect(bike.serial_number).to match(/^\w{3}\s\d{3}-\d{2}-\d{5}/)
  end

  it "be set with a serial number" do
    bike = Bike.new({:serial_number => "DDD 111-11-11111"})

    expect(bike.serial_number).to match(/^\w{3}\s\d{3}-\d{2}-\d{5}/)
  end

  it "stores all serial numbers when a bike is docked" do
  	bike = Bike.new({:serial_number => "DDD 111-11-11111"})
		
		expect(bike.store_serial_number).to eql [{ :serial_number => bike.serial_number}]
	end

	it "should trigger a timer when a bike is released" do
		time = Time.now.round(0)
		bike.rent!
		
		expect(bike.rent_time).to eq time	
	end

	it "should trigger a timer when a bike is returned" do
		bike.rent!
		time = Time.now.round(0)
		bike.return!
		
		expect(bike.return_time).to eq time	
	end
	
	it "should know it has been gone for 1801 seconds" do 
		bike.rent!
		Timecop.travel(1801)
		
		expect { bike.return! }.to raise_error RuntimeError
		expect(bike.seconds_rented).to eq 1801
	end

	it "should raise an error if the user have the bike more than 30 minutes" do
		bike.rent!
		Timecop.travel(1801)
		
		expect{ bike.return! }.to raise_error(RuntimeError, "You have to pay!")
		expect(bike.seconds_rented).to eq 1801
	end
end