class Journey
  attr_reader :journey, :exit

  PENALTY_FARE = 6

  def initialize(entry_station)
    @entry_station = entry_station
  end

  def in_journey?
    @journey.empty? ? false : @journey.length < 2
  end

  def end(station)
    @exit_station = station
    @exit = {exit_station: station}
  end

  def complete?
  @journey.keys[0] == :entry_station && @journey.keys[1] == :exit_station
  end

  def fare
    complete? ? 1 : PENALTY_FARE
  end
end
