require 'journey'
PENALTY, MIN_FARE = 6, 1

describe Journey do
  subject(:journey) { Journey.new() }
  let(:barking) { double :barking, name: 'Barking', zone: 4 }
  let(:aldgate) { double :aldgate, name: 'Aldgate', zone: 1 }

  describe '#fare' do
    it 'should respond to 2 arguments' do
      expect(journey).to respond_to(:fare).with(2).arguments
    end

    it 'should return PENALTY fare when no entry or exit stations' do
      expect(journey.fare(barking, nil)).to eq(PENALTY)
    end

    it 'should return PENALTY fare when no entry or exit stations' do
      expect(journey.fare(nil, barking)).to eq(PENALTY)
    end

    it 'should return MIN_FARE when both stations in same zone' do
      expect(journey.fare(barking, barking)).to eq(MIN_FARE)
    end

    it 'should return correct fare both stations present' do
      expect(journey.fare(barking, aldgate)).to eq(4)
    end

  end

end
