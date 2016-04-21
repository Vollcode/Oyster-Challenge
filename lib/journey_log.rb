require_relative "journey"
class JourneyLog

  attr_reader :journey_class

  def initialize(journey_class=Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(git station)
      @journeys << journey_class.new(entry_station: station)
  end

end
