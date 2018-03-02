require 'journey_log'

describe JourneyLog do
  subject(:journey_log) { described_class.new }
  let(:barking) { double :barking, name: 'Barking', zone: 4 }
  let(:aldgate) { double :aldgate, name: 'Aldgate', zone: 1 }



  describe '#new' do
    it 'history should be empty in the start' do
      expect(journey_log.history).to eq([])
    end
  end

  describe '# start' do
    it 'should respond to 1 argument' do
      expect(journey_log).to respond_to(:start).with(1).arguments
    end

    it 'should respond to zero argument' do
      expect(journey_log).to respond_to(:start).with(0).arguments
    end

    it 'should turn @mid_journey to true' do
      journey_log.start(barking)
      expect(journey_log.mid_journey).to eq(true)
    end

    it 'should set @entry_station to station given' do
      journey_log.start(aldgate)
      expect(journey_log.entry_station).to eq(aldgate)
    end
  end
  describe '# finish' do
    xit 'should set @exit_station to station given' do
      journey_log.finish(barking)
      expect(journey_log.exit_station).to eq(barking)
    end

     it 'should register completed journey in history array' do
       journey_log.start(barking)
       journey_log.finish(aldgate)
       expect(journey_log.history.last).to eq({from: barking, to: aldgate, fare: 4})
     end

     it 'should register incomplete journey (no touch_in) in history[]' do
       journey_log.finish(aldgate)
       expect(journey_log.history.last).to eq({from: nil, to: aldgate, fare: 6})
     end

     it 'should register incomplete journey (no touch_out) in history[]' do
       journey_log.start(barking)
       journey_log.finish
       expect(journey_log.history.last).to eq({from: barking, to: nil, fare: 6})
     end

  end

  describe '# in_journey' do
    it 'should check @mid_journey returns true after journey starts' do
      journey_log.start(barking)
      expect(journey_log.in_journey?).to eq(true)
    end
    it 'should check @mid_journey returns false before journey starts' do
      expect(journey_log.in_journey?).to eq(false)
    end

    it 'should check @mid_journey returns false after journey ends' do
      journey_log.start(barking)
      journey_log.finish(aldgate)
      expect(journey_log.in_journey?).to eq(false)
    end


  end

  # it 'should push history hash to history[]' do
  #   oystercard.topup(MIN_FARE)
  #   oystercard.touch_in(barking)
  #   oystercard.touch_out(aldgate)
  #   expect(oystercard.completed_journeys).to eq([{ from: barking, to: aldgate, fare: MIN_FARE}])
  # end


end
