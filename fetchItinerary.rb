def fetch_itinerary(flights, start)
  solve(flights, start, [])
end

def solve(flights, start, current_itinerary)
 if flights.size <= 0 || !flights
  return current_itinerary + [start] 
 end

  update_itinerary = nil
  flights.each.with_index do |(origin, destination), index|
    if start == origin
      new_itinerary = current_itinerary + [origin]
      child_itinerary = solve(
        remaining_flights(flights, index), destination, new_itinerary
      )

      if !update_itinerary || child_itinerary.size > update_itinerary.size
        update_itinerary = child_itinerary
      end
    end
  end

  update_itinerary
end

def remaining_flights(flights, index)
  if index <= 0
    return flights[(index + 1).. -1]
  else
    return flights[0..(index - 1)] + flights[(index + 1)..-1]
  end
end

# fetch_itinerary([
#   ['SFO', 'HKO'], ['YYZ', 'SFO'], ['YUL', 'YYZ'],
#   ['HKO', 'ORD']
# ], "YUL") # => ["YUL", "YYZ, "SFO", "HKO"]