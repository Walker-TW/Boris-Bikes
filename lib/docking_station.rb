require_relative 'bike'

class DockingStation
  attr_reader :bike

  def dock(bike)
    raise "Dock is full" unless @bike == nil
    @bike = bike
  end

  def release_bike
    @bike
  end

  def bike_exist?
    fail "No bike" unless @bike
  end
end
