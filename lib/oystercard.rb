class Oystercard

  MAXIMUM_BALANCE = 90
  STANDARD_FARE = 1

  attr_reader :balance

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up money
    raise "Top up limit is #{MAXIMUM_BALANCE}" if money + balance > MAXIMUM_BALANCE
    @balance += money
  end

  def in_journey?
    @in_use
  end

  def touch_in
    fail "You have insufficient funds" unless balance > 1
    @in_use = true
  end

  def touch_out
    deduct(STANDARD_FARE)
    @in_use = false
  end

  private

  def deduct money
    @balance -= money
  end

end
