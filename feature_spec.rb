require "./lib/oystercard.rb"

oyster = Oystercard.new
fail "new oyster doesn't have £0 on it" unless oyster.balance == 0

# In order to keep using public transport
# As a customer
# I want to add money to my card
# oyster.top_up(6)
# fail "oyster did not top up" unless oyster.balance == @balance

# In order to protect my money from theft or loss
# As a customer
# I want a maximum limit (of £90) on my card

oyster.top_up(85)
# fail "topped up over limit" if oyster.balance > 90

# In order to pay for my journey
# As a customer
# I need my fare deducted from my card
 oyster.deduct(6)
 fail "did not deduct £6" unless oyster.balance == (balance - 6)
