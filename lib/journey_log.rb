# Journey_Log class
# Responsible for creating and storing journey info (logs)
# Journey class on other hand will calculate fare and take care of penalty etc

class JourneyLog

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

# redundant method as finish() can achieve the same
# when not given arguements
  # def implement_penalty
  #   @history << log_journey()
  #   @journey.fare(@entry_station, @exit_station)
  # end

  def finish(station = nil)
    @exit_station = station
    # fare = @journey.fare(@entry_station, @exit_station)
    @history << log_journey
    # reset all journey related stuff to default as it's completed and stored
    reset_journey
    # fare # return fare
    @history.last[:fare]
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
