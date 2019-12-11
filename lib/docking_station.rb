class DockingStation
  attr_reader :bike_rack

  def initialize(capacity = 20)
    @bike_rack = []
    @capacity = capacity
  end
  def release_bike
    raise 'No bike is present' if empty?
    @bike_rack.pop
  end

  def dock(bike)
    raise 'No docking station are free' if full?
    @bike_rack << bike
  end

  private
  def full?
    @bike_rack.size == @capacity
  end

  def empty?
    @bike_rack.empty?
  end
end