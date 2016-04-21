require_relative 'journey_log'

class Oystercard

  attr_reader :balance
  LIMIT = 90
  MIN_BAL = 1
  MIN_FARE = 1

  def initialize
    @balance = 0
    @journey_log = JourneyLog.new
  end

  def top_up(amount)
    raise "maximum limit is £#{LIMIT}" if @balance + amount > LIMIT
    @balance += amount
  end

  def touch_in(station)
    fail "min balance has to be >£#{MIN_BAL}" if @balance < MIN_BAL
    @journey_log.start(station)

  end

  def touch_out(station)
    deduct(MIN_FARE)
    @journey_log.finish(station)
  end

  private
  def deduct(amount)
    @balance -= amount
  end
end
