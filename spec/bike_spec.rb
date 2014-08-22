require 'bike'

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


	# end
	# xit "every serial number should be unique" do
	# 	bike   = Bike.new({:serial_number => "DDD 111-11-11111"})
	# 	bike_2 = Bike.new({:serial_number => "DDD 111-11-11111"})

	# 	expect(bike.serial_number).not_to eql(bike_2.serial_number)

	# end

end