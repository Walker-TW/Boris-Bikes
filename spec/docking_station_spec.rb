require './lib/bike.rb'
require './lib/docking_station'

describe DockingStation do
  let(:station) {DockingStation.new}
  
    it {is_expected.to respond_to('release_bike')} 
  
    it "release a working bike" do
      bike = Bike.new
      expect(bike).to be_working
    end

    it "stocks a bike" do
    expect(station.dock(Bike.new)).to be_a(Array)
    end

    it {is_expected.to respond_to('dock').with(1).argument}

    it {is_expected.to respond_to('bike_rack')}

    it "docking station does not have a bike" do
      expect {station.release_bike}.to raise_error("No bike is present")
    end

    describe "release_bike" do
      it "doesnt work" do
        station.dock(Bike.new)
        expect(station.release_bike).to be_a(Bike)
        end
      end

  describe "#dock" do

  describe '#dock' do
  it 'docking 15 bikes store all of them' do
    15.times { station.dock(Bike.new) }
    expect(station.bike_rack.size).to eq(15)
  end

  it 'raise an error if capacity is at 20' do
    20.times { station.dock(Bike.new) }
    expect { station.dock(Bike.new) }.to raise_error('No docking station are free')
  end
  end
end
end


