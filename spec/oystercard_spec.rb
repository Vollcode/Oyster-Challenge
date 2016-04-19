require "oystercard"

describe Oystercard do

   it { expect(subject).to respond_to(:balance, :in_journey?, :travelled_from) }
   it { expect(subject).to respond_to(:top_up, :touch_in, :touch_out).with(1).argument}

   let(:weeksfare) {50}
   let(:station) { double(:station)}
   let(:station2) { double(:station2)}
  #  let(:oyster) { double(:oyster, top_up: 50)}

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

  describe "#in_journey" do
    it "should not be in_journey when created" do
      expect(subject).not_to be_in_journey
    end
  end

  describe "#touch_in" do
    it "should touch in" do
      subject.top_up(weeksfare)
      subject.touch_in station
      expect(subject.in_journey?).to eq true
    end

    it 'should not allow to touch in if you have insufficient funds' do
      expect{subject.touch_in(station)}.to raise_error("You have insufficient funds")
    end
  end

  describe "#touch_out" do
    it "should touch out" do
      subject.touch_out(station)
      expect(subject.in_journey?).to eq false
    end

    it "should charge a fee on touch out" do
      subject.top_up(weeksfare)
      subject.touch_in (station)
      expect{subject.touch_out(station)}.to change{subject.balance}.by(-Oystercard::STANDARD_FARE)
    end
  end

  describe "#travelled_from?" do
    it "should return station you touched in" do
      subject.top_up(weeksfare)
      subject.touch_in station
      expect(subject.travelled_from).to eq station
    end
  end

  describe '#history' do
    it 'should show the entry and the exit stations' do
      subject.top_up(weeksfare)
      subject.touch_in(station)
      subject.touch_out(station2)
      expect(subject.history).to eq [station, station2]
    end
  end
end
