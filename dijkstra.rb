class Vertex
  def initialize(node)
    @id = node
    @adjacent = {}
    @distance = 1000000
    @visited = false
    @previous = nil
  end

  def add_neighbour(neighbour, weight=0)
    @adjacent[neighbour] = weight
  end

  def get_connections
    @adjacent.keys
  end

  def adjacents
    @adjacent.keys
  end
  
  def get_id
    @id
  end

  def get_weight(neighbour)
    @adjacent[neighbour]
  end 

  def set_distance(dist)
    @distance = dist
  end

  def get_distance
    @distance
  end

  def set_previous(prev)
    @previous = prev
  end

  def previous
    @previous
  end

  def set_visited
    @visited = true
  end

  def visited
    @visited
  end

  def reset
    @visited = false
    @previous = nil
    @distance = 0
  end
end

class Graph
  def initialize
    @vert_dict = {}
    @num_vertices = 0
    @previous = nil
  end

  def add_vertex(node)
    @num_vertices += 1
    new_vertex = Vertex.new(node)
    @vert_dict[node] = new_vertex
  end

  def get_vertex(n)
    @vert_dict[n]
  end

  def get_vertices
    @vert_dict.keys
  end

  def vertices
    @vert_dict.values
  end

  def non_visited_vertices
    @vert_dict.select{|k,v| !v.visited }.values
  end

  def set_previous(current)
    @previous = current
  end

  def add_edge(frm, to, cost = 0)
    if !self.get_vertices.include?(frm)
      self.add_vertex(frm)
    end

    if !self.get_vertices.include?(to)
      self.add_vertex(to)
    end

    @vert_dict[frm].add_neighbour(@vert_dict[to], cost)
    @vert_dict[to].add_neighbour(@vert_dict[frm], cost)
  end

  def reset
    @vert_dict.each do |k, v|
      v.reset
    end
  end
end

def evaluate(from, to)
  from = g.get_vertex(from)
  to_vertex = g.get_vertex(to)

  dijkstra(g, from_vertex) 
  path = []
  path << to_vertex.get_id

  shortest_path(to_vertex, path)
  path.reverse
end

def shortest_path(v, path)
  if v.previous
    path << v.previous.get_id 
    shortest(v.previous, path)
  end
end


def dijkstra(graph, start)
  start.set_distance(0)
  unvisited_queue = graph.vertices.map{|v| [v.get_distance, v]}.sort_by{|u| u[0] }

  count = 0 
  while !unvisited_queue.empty?
    unvisited = unvisited_queue.shift
    current = unvisited[1]
    current.set_visited

    current.adjacents.each do |adjacent|
      if adjacent.visited
        next
      end

      new_dist = current.get_distance + current.get_weight(adjacent)

      if new_dist < adjacent.get_distance
        adjacent.set_distance(new_dist)
        adjacent.set_previous(current)
      end

      count += 1
    end

    unvisited_queue = graph.
      non_visited_vertices.map{|v| [v.get_distance, v]}.
      sort_by{|u| u[0]}
  end
end

# g = Graph.new

# g.add_vertex('a')
# g.add_vertex('b')
# g.add_vertex('c')
# g.add_vertex('d')
# g.add_vertex('e')

# g.add_edge('a', 'b', 7)  
# g.add_edge('a', 'c', 9)
# g.add_edge('b', 'c', 10)
# g.add_edge('b', 'd', 15)
# g.add_edge('c', 'd', 11)
# g.add_edge('d', 'e', 6)

# evaluate('a', 'e')