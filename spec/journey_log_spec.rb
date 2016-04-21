require "journey_log"

describe JourneyLog do

  let(:journey_class) { double :journey_class, new: journey }
  let(:journey) { double :journey }
  let(:station) { double :station }
  subject { JourneyLog.new journey_class }

  it "initializes with a journey_class" do
    expect(subject.journey_class).to eq journey_class
  end

  describe "#start" do
    it "starts a new journey with an entry station" do
      expect(journey_class).to receive(:new).with(entry_station: station)
      subject.start(station)
    end
  end

  describe "#current_journey" do

  end

  describe "#finish" do

  end

  describe "#journeys" do

  end

end
