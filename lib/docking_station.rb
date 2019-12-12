class DockingStation
  attr_reader :bike_rack, :capacity
  # if referenced in rspec as a method it needs to be a symbol
  DEFAULT_CAPACITY = 20
  def initialize(capacity=DEFAULT_CAPACITY)
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