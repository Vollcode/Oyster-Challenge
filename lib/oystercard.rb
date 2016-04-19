class Oystercard
  attr_accessor :balance

  MAXIMUM_CAPACITY = 90

  def initialize(money=0)
    @balance = 0
  end

  def top_up(money)
    fail "Sorry, the upper limit of an oyster card is £#{MAXIMUM_CAPACITY}" if balance + money >= MAXIMUM_CAPACITY
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end
end
