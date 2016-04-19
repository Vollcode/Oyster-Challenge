require 'oystercard'

describe Oystercard do

  let(:topuperror) {"Sorry, the upper limit of an oyster card is £#{Oystercard::MAXIMUM_CAPACITY}"}


  it 'should be initialized with a default value of zero' do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do

    it 'should have the balance of adding money' do
      expect(subject.top_up(50)).to eq 50
    end

    it 'should have a limit of 90£' do
      expect{subject.top_up(Oystercard::MAXIMUM_CAPACITY)}.to raise_error(topuperror)
    end
  end

  describe '#deduct' do

    it 'shouel be able to deduct money from the balance' do
      subject.top_up(50)
      expect(subject.deduct(30)).to eq 20
    end
  end
end
