# Journey class definiation
# This takes care of all journey related things and should return journey info
# when referred to
class Journey
  attr_reader :mid_journey, :entry_station, :exit_station

  def initialize
    @mid_journey = false
    @entry_station = @exit_station = nil
  end

# start journey methods
  def start(station = nil)
    #  if you are already in journey it should charge you PENALTY
    #  and create a journey log
    # if in_journey
    #
    # end

    # if not then do the following
    @mid_journey = true
    @entry_station = station
  end

  def stop(station = nil)
    @exit_station = station
    log_journey
    # reset all journey related stuff to default as it's completed and stored
    reset_journey


    return @journey
  end

  def in_journey?
    @mid_journey
  end

  private
  def reset_journey
    @mid_journey = false
    @entry_station = @exit_station = nil
  end

  def log_journey
    @journey = {from: @entry_station, to: exit_station}
  end

end
