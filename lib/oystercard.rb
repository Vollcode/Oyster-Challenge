require_relative "journey"
class Oystercard

  MAXIMUM_BALANCE = 90
  STANDARD_FARE = 1

  attr_reader :balance, :entry

  def initialize
    @balance = 0
    @in_use = false
    @history = []
  end

  def top_up money
    raise "Top up limit is #{MAXIMUM_BALANCE}" if money + balance > MAXIMUM_BALANCE
    @balance += money
  end

  def in_journey?
    !!entry
  end

  def touch_in station#(name, zone)
    fail "You have insufficient funds" unless balance > 1
    @entry = station
    @in_use = true
    @history << station
  end

  def touch_out(station)
    deduct(STANDARD_FARE)
    @entry = nil
    @history << station
  end

  def travelled_from
    @entry
  end

  def history
    @history
  end

  private

  def deduct money
    @balance -= money
  end
end
