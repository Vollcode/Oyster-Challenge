require_relative 'journey'

class OysterCard

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 2

  attr_reader :balance, :journeys, :current_journey

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journeys = []
  end

  def top_up(amount)
    fail "New balance exceeds #{MAXIMUM_BALANCE}!" if limit_exceeded?(amount)
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient balance!" if insufficient_balance?
    unless @current_journey == nil
      @current_journey[:entry_station] = nil
      @journeys << @current_journey
    end
    # deduct_fare(PENALTY_FARE) unless @current_journey.trip.empty?
    @current_journey = Journey.new(station)
  end

  def touch_out(station)
    if @current_journey.trip == nil
      @current_journey[:exit_station] = nil
      @journeys << @current_journey
    else
      @current_journey.finish(station)
      @journeys.push(@current_journey)
      # check if @current_journey is complete?, and if it doesn't, charge penalty
    end
    # deduct_fare(MINIMUM_FARE)
    @current_journey.trip.clear
  end

  def in_journey?
    # journeys.empty? ? false : journeys.last.length < 2
  end

  private

  def limit_exceeded?(amount)
    @balance + amount > MAXIMUM_BALANCE
  end

  def insufficient_balance?
    @balance < MINIMUM_BALANCE
  end

  def deduct_fare(amount)
    @balance -= amount
  end

  def record_start_station(station)
    @journeys << {:entry_station => station}
  end

  def record_end_station(station)
    @journeys.last[:exit_station] = station
  end

end
