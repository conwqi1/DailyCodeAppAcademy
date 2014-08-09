class PolyTreeNode
  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end
  
  def parent
    @parent
  end
  
  def children
    @children
  end
  
  def value
    @value
  end
  
  def parent=(new_value)
    #@parent.children.delete self
    unless @parent.nil?
      @parent.children.delete(self)
    end
    
    @parent = new_value
    
    #check to see if children are already in new parent
    unless new_value == nil
      @parent.children << self
    end  
  end
  
  def add_child(child_node)
    #@children << child_node 
    child_node.parent = (self)
  end

  def remove_child(child)
    raise "#{child} node is not a child" if child.parent == nil 
    #@children.delete(child)
    child.parent = nil
  end
  
  def dfs(value)
    return self if self.value == value
    self.children.each do |child|
      result = child.dfs(value)
      return result if result
    end
    nil
  end
  
  def bfs(value)
    #return self if self.value == value
    queue = [self]
    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == value
      queue.concat(current_node.children)
      #p queue
    end
    nil
  end 
  
  def trace_path_back
    path_array = []
    node = self
    until node.nil?
      path_array << node.value
      node = node.parent
    end
    path_array.reverse
  end
end
