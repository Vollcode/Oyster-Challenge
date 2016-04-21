require 'journey'

describe Journey do

  let(:entrystation) {double :entrystation}
  let(:exitstation) {double :exitstation}
  let(:journey){ {entry_station: entrystation, exit_station: exitstation} }
  let(:entry_hash){ {entry_station: entrystation} }
  subject(:journey_sub) { described_class.new(:entry_hash) }

    describe '#journey' do
      it "stores entry and exit stations in a hash" do
        subject.end(exitstation)
        expect(subject.journey).to eq journey
      end

      it 'starts with an empty hash' do
        expect(subject.journey).to be_empty
      end
    end

    it "returns false on in_journey" do
      subject.end(exitstation)
      expect(subject.in_journey?).to eq false
    end

    it "remembers the last station" do
      subject.end(exitstation)
      expect(subject.journey[:exit_station]).to eq exitstation
    end

    describe '#in_journey?' do
      it "returns false if we are not in a journey" do
        expect(subject.in_journey?).to eq false
      end

      it "returns true on in_journey" do
        expect(subject.in_journey?).to eq true
      end

      it "remembers the station after it touched in" do
        expect(subject.journey[:entry_station]).to eq entrystation
      end
    end

    describe "#fare" do
      it "returns minimum fare" do
        subject.entry_station(entrystation)
        subject.end(exitstation)
        expect(subject.fare).to eq 1
      end
      it "returns 6 if entry only" do
        subject.entry_station(entrystation)
        subject.entry_station(entrystation)
        expect(subject.fare).to eq Journey::PENALTY_FARE
      end
      it "returns 6 if exit only" do
        subject.end(exitstation)
        expect(subject.fare).to eq Journey::PENALTY_FARE
      end
    end
end
