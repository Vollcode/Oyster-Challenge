require "journey_log"

describe JourneyLog do


  let(:journey) { double :journey }
  let(:station) { double :station }
  let(:journey_class) { double :journey_class, new: journey }
  subject { JourneyLog.new journey_class }

  it "initializes with a journey_class" do
    expect(subject.journey_class).to eq journey_class
  end

  describe "#start" do
    it "starts a new journey with an entry station" do
      expect(journey_class).to receive(:new).with(station)
      subject.start(station)
    end
  end

  describe "#finish" do
    it "adds an exit station to journeys" do
      subject.start(station)
      subject.finish(station)
      expect(subject.journeys).to include journey
    end
  end

  describe "#journeys" do
    it "records a journey" do
      allow(journey_class).to receive(:new).and_return journey
      subject.start(station)
      expect(subject.journeys).to include journey
    end
  end
end
