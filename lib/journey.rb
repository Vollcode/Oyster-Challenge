class Journey
  attr_reader :journey

  PENALTY_FARE = 6

  def initialize(entry_station)
    @journey = {}
  end

  def in_journey?
    @journey.empty? ? false : @journey.length < 2
  end

  def entry_station(station)
    @journey[:entry_station] = station
  end

  def exit_station(station)
    @journey[:exit_station] = station
  end

  def complete?
  @journey.keys[0] == :entry_station && @journey.keys[1] == :exit_station
  end

  def fare
    complete? ? 1 : PENALTY_FARE
  end
end
