require_relative 'journey_log'
require_relative 'journey'
require_relative 'station'

class OysterCard
  attr_reader :balance

  # default constants (defined in one line)
  MIN_BAL = 0
  MAX_BAL = 90

  def initialize(balance = MIN_BAL, journey_log = JourneyLog.new)
    @balance = balance
    # @completed_journeys = []
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
    deduct(@journey_log.implement_penalty) if @journey_log.in_journey?
    raise 'Insufficient balance' if @balance < 1 #get this min fare from journey class
    @journey_log.start(station)
  end

  def touch_out(station)
    fare = @journey_log.finish(station)
    deduct(fare)
  end

  private

  def deduct(correct_fare)
    @balance -= correct_fare
  end

end
