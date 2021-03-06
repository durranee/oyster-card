# Journey class definiation
# This takes care of all journey related things and should return journey info
# when referred to
class Journey
  PENALTY, MIN_FARE = 6, 1

  def fare(entry_station, exit_station)
    entry_station.nil? || exit_station.nil? ? PENALTY : MIN_FARE + (entry_station.zone-exit_station.zone).abs
  end

end
