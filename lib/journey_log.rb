require_relative "journey"
class JourneyLog

  attr_reader :journey_class, :journeys

  def initialize(journey_class=Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
      @current_journey = journey_class.new(entry_station: station)
  end

  def finish(station)
    @current_journey.journey.merge!(@current_journey.end(station))
    @journeys << @current_journey

  end

  private
  def current_journey

    @current_journey || journey_class.new
  end

  def add(journey)
    @journeys << journey
  end

end
