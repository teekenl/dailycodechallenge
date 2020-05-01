require 'set'

def num_buses_to_destination(routes, s, t)
  return -1 if !s || !t
  return 0 if s == t

  stop_bus = Hash.new

  routes.each.with_index do |route, i|
    route.each do |stop|
      stop_bus[stop] ||= Array.new
      stop_bus[stop] << i
    end
  end

  bus_visited = Set.new
  path = []
  path << [s, 1]

  while !path.empty?
    stop, buses = path.shift()
    stop_bus[stop].each do |bus|
      if bus_visited.include?(bus)
        next
      end

      bus_visited.add(bus)
      routes[bus].each do |r|
        if r == t
          return buses
        end

        path << [r, buses + 1]
      end
    end
  end

  return -1
end