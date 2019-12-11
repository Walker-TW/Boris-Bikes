class DockingStation
  attr_reader :bike_rack
  def initialize
    @bike_rack = []
    @capacity = 20
  end
  def release_bike
    raise 'No bike is present' if @bike_rack.empty?
    @bike_rack.pop
  end
  def dock(bike)
    raise 'No docking station are free' unless @bike_rack.size < @capacity
    @bike_rack << bike
  end
end