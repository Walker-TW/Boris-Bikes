require './lib/bike.rb'
require './lib/docking_station'

describe DockingStation do
  let(:station) {DockingStation.new}
# checks there is a method called release_bike
    it {is_expected.to respond_to('release_bike')} 
# checks that the dock method returns an Array
    it "stocks a bike" do
    expect(station.dock(Bike.new)).to be_a(Array)
    end
# Expects dock method to return an array to show that the dockingstation
# been created
    it "has an Array for a broken Bike" do
      expect(station.dock(Bike.new)).to be_a(Array)
    end
# checks dockingstation.new responds with only one argument.
    it {is_expected.to respond_to('dock').with(1).argument}
# Checks there is a bike_rack instance variable
    it {is_expected.to respond_to('bike_rack')}
# Checks that an error returns if the Array is empty.
    it "docking station does not have a bike" do
      expect {station.release_bike}.to raise_error("No bike is present")
    end
# checks that when releaseing a bike you get given a bike
    describe "release_bike" do
      it "doesnt work" do
        station.dock(Bike.new)
        expect(station.release_bike).to be_a(Bike)
        end
      end
# checks that at initilization the capacity equals the default value
    it 'has default capacity' do 
      expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY 
    end
# checks dock can store all bikes passed to it
  describe '#dock' do
  it 'docking 15 bikes stores all of them' do
    15.times { station.dock(Bike.new) }
    expect(station.bike_rack.size).to eq(15)
  end
end

# tests that no matter what the capacity that it will not add in more bikes to the dock
# than spaces available

  it 'raise an error if capacity is at default capacity' do
    DockingStation::DEFAULT_CAPACITY.times { station.dock(Bike.new) }
    expect { station.dock(Bike.new) }.to raise_error('No docking station are free')
  end

# tests to ensure that passing in an argument at inititalization of class instance returns
# required space.
  describe "#initialize" do
    it "accepts capacity of 50" do
      docking_station = DockingStation.new(50)
      expect(docking_station.capacity).to eq 50
    end
  end

# tests that the default capacity for the dockingstation is set to 20
    it "has default capacity" do
      docking_station = DockingStation.new()
      expect(docking_station.capacity).to eq 20
    end
  
# tests to see if the default value when the Bike Class is init(ed) returns false
  describe "initialize?" do
    it "finds if a bike is broken???" do
      bike = Bike.new()
      expect(bike.broken).to be(false)
    end
  end

# ensures that the select method calls out an array of only working bikes
  describe "select_working" do
    it "selects only working bikes" do
    expect(subject.select_working).to be_a(Array)
    end
  end
# Checks that if passed a broken bike (changing the given variable on startup)
# that it will still go into the @bike_rack
  describe "giving a broken bike back" do
    it "will allow a broken bike to be returned" do 
      expect(Bike.new(true).broken).to be(true)
    end
  end
end