class Journey
  attr_reader :journey, :exit

  PENALTY_FARE = 6

  def initialize(entry_station)
    @entry_station = entry_station
    @journey = {}
    @complete = false
  end

  def in_journey?
    @journey.empty? ? false : @journey.length < 2
  end

  def end(station)
    @exit_station = station
    @exit = {exit_station: station}
    @journey = @entry_station.merge! @exit
    @complete = true
  end

  def complete?
    @complete
  end

  def fare
    complete? ? 1 : PENALTY_FARE
  end
end
