require "journey_log"
describe JourneyLog do



  let(:journey) { double :journey }
  let(:station) { double :station }
  let(:entry_hash){ {entry_station: station} }
  let(:journey_class) { double :journey_class, new: journey }
  let(:journey_hash) {{ entry_station: station, exit_station: station}}
  subject { JourneyLog.new journey_class }

  it "initializes with a journey_class" do
    expect(subject.journey_class).to eq journey_class
  end

  describe "#start" do
    it "starts a new journey with an entry station" do
      expect(journey_class).to receive(:new).with(entry_hash)
      subject.start(station)
    end
  end

  describe "#finish" do
    it "adds an exit station to journeys" do
      subject.start(station)
      allow(journey).to receive(:journey) {journey_hash}
      allow(journey).to receive(:end)
      subject.finish(station)
      expect(subject.journeys).to eq([journey_hash])
    end
  end
end
