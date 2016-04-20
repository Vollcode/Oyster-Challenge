require 'journey'

describe Journey do

  subject {described_class.new('Bond Street')}
  let(:station){double :station}

  describe '#initialize' do

    it 'record an entry station' do
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

  end

  describe '#complete?' do

    it "should return false if you've only touched-in" do
      expect(subject.complete?).to eq false
    end


    it "should return false if you finish, without touching-in" do
      subject {described_class.new}
      subject.finish(station)
      expect(subject.complete?).to eq false
    end



  end


end
