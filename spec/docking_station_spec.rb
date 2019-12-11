require './lib/docking_station'

describe DockingStation do
  let(:station) {DockingStation.new}
  
    it {is_expected.to respond_to('release_bike')} 
  
    it "release a working bike" do
      bike = Bike.new
      expect(bike).to be_working
    end

    it "stocks a bike" do
    expect(station.dock(Bike.new)).to be_a(Bike)
    end

    it {is_expected.to respond_to('dock').with(1).argument}

    it {is_expected.to respond_to('bike')}

    it "docking station does not have a bike" do
      expect {station.bike_exist?}.to raise_error("No bike")
    end

    describe "release_bike" do
      it "doesnt work" do
        station.dock(Bike.new)
        expect(station.release_bike).to be_a(Bike)
        end
      end

  describe "#dock" do

  it "Capacity is full" do
    station.dock(Bike.new)
    expect{station.dock(Bike.new)}.to raise_error("Dock is full")
  end
end
end


