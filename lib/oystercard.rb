require_relative 'journey_log'
require_relative 'journey'
require_relative 'station'

class OysterCard

  # balance don't need to be accessed from outside
  # attr_reader can be turned off for this (only opened for test)
  attr_reader :balance

  # default constants (defined in one line)
  MIN_BAL, MAX_BAL = 0, 90

  def initialize(balance = MIN_BAL, journey_log = JourneyLog.new)
    @balance = balance
    @journey_log = journey_log
  end

  # topup method tops up the oystercard with amount given
  # (throws error if amount + current balance goes above MAX_BAL)
  def topup(amount)
    raise 'Balance cannot be more than £90' if (@balance + amount) > MAX_BAL
    @balance += amount
  end

  # touch_in method take station object in and starts a journey
  # throws error if balance is less than MIN_FARE
  def touch_in(station)
    deduct(@journey_log.finish) if @journey_log.in_journey?
    raise 'Insufficient balance' if @balance < Journey::MIN_FARE # TODO: get this min fare from journey class
    @journey_log.start(station)
  end

  def touch_out(station)
    fare = @journey_log.finish(station)
    deduct(fare)
  end

  def journeys
    @journey_log.journeys.each {|journey| puts journey}
  end
  private

  def deduct(correct_fare)
    @balance -= correct_fare
  end

end
