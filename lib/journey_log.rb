# Journey_Log class
# Responsible for creating and storing journey info (logs)
# Journey class on other hand will calculate fare and take care of penalty etc
require_relative 'journey'

class JourneyLog
  attr_reader :history, :mid_journey, :entry_station, :exit_station # turn them all off after tests

  def initialize
    @journey = Journey.new()
    @mid_journey = false
    @entry_station = @exit_station = nil
    @history = []
  end

# start journey methods
  def start(station = nil)
    @mid_journey = true
    @entry_station = station
  end

  def finish(station = nil)
    @exit_station = station
    @history << log_journey
    reset_journey
    @history.last[:fare] # returns fare
  end

  def in_journey?
    @mid_journey
  end

  def journeys
    @history
  end

  private

  def reset_journey
    @mid_journey = false
    @entry_station = @exit_station = nil
  end

  def log_journey
    { from: @entry_station, to: @exit_station, fare: @journey.fare(@entry_station, @exit_station) }
  end

end
