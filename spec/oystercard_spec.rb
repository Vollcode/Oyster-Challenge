require "oystercard"

describe Oystercard do

   it { expect(subject).to respond_to(:balance, :in_journey?, :touch_in, :touch_out) }
   it { expect(subject).to respond_to(:top_up, :deduct).with(1).argument}

   describe "#balance" do

     it "should be 0 when new oyster created by default" do
       expect(subject.balance).to eq 0
     end
   end

   describe "#top_up" do

     it "should add money to previous balance" do
       expect{subject.top_up 6 }.to change{ subject.balance }.by 6
     end

     it "should limit the top_up amount to £90" do
       max_balance = Oystercard::MAXIMUM_BALANCE
       subject.top_up max_balance
       expect{ subject.top_up 1 }.to raise_error "Top up limit is #{max_balance}"
     end
   end

   describe "#deduct" do

    it "should deduct a fare" do
      subject.top_up 20
      expect(subject.deduct(6)).to eq 14
    end
  end

  describe "#in_journey" do
    it "should not be in_journey when created" do
      expect(subject).not_to be_in_journey
    end
  end

  describe "#touch_in" do
    it "should touch in" do
      subject.touch_in
      expect(subject.in_journey?).to eq true
    end
  end

  describe "#touch_out" do
    it "should touch out" do
      subject.touch_out
      expect(subject.in_journey).to eq false
    end
  end
end
