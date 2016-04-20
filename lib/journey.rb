class Journey
  attr_reader :trip, :entry

  def initialize(station=nil)
    @trip = {:entry_station => station}
    @entry = (station != nil ? true : false)
  end

  def finish(station)
    @trip[:exit_station] = station
  end

  def fare
  end

  def complete?
    trip.include?(:exit_station) && trip.values.include?(nil)
  end

end
