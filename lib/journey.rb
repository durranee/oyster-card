# Journey class definiation
# This takes care of all journey related things and should return journey info
# when referred to
class Journey
  PENALTY = 6
  MIN_FARE = 1

  def initialize
  end

  def fare(entry_station, exit_station)
    entry_station.nil? || exit_station.nil? ? PENALTY : MIN_FARE
  end

end
