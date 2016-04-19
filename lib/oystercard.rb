class Oystercard

  MAXIMUM_BALANCE = 90
  
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up money
    raise "Top up limit is #{MAXIMUM_BALANCE}" if money + balance > MAXIMUM_BALANCE
    @balance += money
  end

  def deduct money
    @balance -= money
  end
end
