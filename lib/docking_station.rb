require_relative 'bike'

class DockingStation
  attr_reader :bike_rack, :broken
  attr_accessor :capacity
  # if referenced in rspec as a method it needs to be a symbol
  DEFAULT_CAPACITY = 20
  
  def initialize(capacity=DEFAULT_CAPACITY)
    @bike_rack = []
    @capacity = capacity
  end
  
  def release_bike
    raise 'No bike is present' if empty?
    select_working.pop
  end


   def select_working
     @bike_rack.select {|x| x.broken == false }
   end

  def dock(bike)
    if full?
      raise 'No docking station are free'
    else
      @bike_rack << bike 
    end
  end

  private
  
  def full?
    @bike_rack.size == @capacity
  end

  def empty?
    @bike_rack.empty?
  end
end
 