require './00_tree_node'

class KnightPathFinder
  
  def self.valid_moves(pos)
    valid_moves_array = []
    possible_moves = []
    possible_moves = [[pos[0] + 2, pos[1] + 1],
    [pos[0] + 1, pos[1] + 2],
    [pos[0] - 1, pos[1] + 2],
    [pos[0] - 2, pos[1] + 1],
    [pos[0] - 2, pos[1] - 1],
    [pos[0] - 1, pos[1] - 2],
    [pos[0] + 1, pos[1] - 2],
    [pos[0] + 2, pos[1] - 1]]
    possible_moves.each do |move|
      if (0...8).to_a.include?(move[0]) && (0...8).to_a.include?(move[1]) 
         valid_moves_array << move 
      end
    end
    
    valid_moves_array
  end
  
  def initialize(start_position)
    @start_position = start_position
    @move_tree = PolyTreeNode.new(start_position)
    @visited_positions = [start_position]
  end
  
  attr_accessor :move_tree
  
  def find_path(end_position)
    last_node_value = @move_tree.bfs(end_position)
    #last_node = PolyTreeNode.new(last_node_value)
    last_node_value.trace_path_back
  end
  
  def build_move_tree(end_position)
    queue = [@move_tree]
    until queue.empty?
      current_node = queue.shift
      new_move_positions(current_node.value).each do |element| 
        child_of_current = PolyTreeNode.new(element)
        current_node.add_child(child_of_current)
        queue << child_of_current 
      end
    end
  end
  
  def new_move_positions(pos)
    new_positions = []
      self.class.valid_moves(pos).each do |ele|
        #keep this in mind when testing because new moves could cause you to             backtrack
        if !@visited_positions.include?(ele)
          @visited_positions << ele
          new_positions << ele 
        end
      end
    new_positions
  end
  
end