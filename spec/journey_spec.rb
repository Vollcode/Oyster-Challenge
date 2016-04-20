require 'journey'

describe Journey do

  subject {described_class.new('Bond Street')}
  let(:station){double :station}

  describe '#initialize' do

    it 'records an entry station' do
      expect(subject.entry).to eq true
    end

    it 'should store entry station' do
      expect(subject.trip).to eq({:entry_station => 'Bond Street'})
    end
  end

  describe '#finish' do

    it 'should store exit station' do
      subject.finish('hoxton')
      expect(subject.trip).to eq({:entry_station => 'Bond Street', :exit_station => 'hoxton'})
    end

    it 'store a complete journey' do
      hoxton = Station.new('Hoxton', 3)
      liverpool = Station.new('Liverpool', 4)
      journey = Journey.new(hoxton)
      journey.finish(liverpool)
      expect(journey.trip).to eq({:entry_station => hoxton, :exit_station => liverpool})
    end
  end

  describe '#complete?' do

    context 'incomplete journey' do

      it "should return false if you've only touched-in" do
        expect(subject.complete?).to eq false
      end

      it "should return false if you finish, without touching-in" do
        journey = Journey.new
        journey.finish(station)
        expect(journey.complete?).to eq false
      end
    end

    context 'complete journey' do

      it "should return true" do
        subject.finish(double(:station))
        expect(subject.complete?).to eq true
      end
    end
  end
end
