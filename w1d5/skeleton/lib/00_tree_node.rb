class PolyTreeNode

  attr_accessor :value
  attr_reader :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node) #node is an object and parent = nil

      if @parent.nil? #parent == nil is true
        @parent = node
        node.children << self unless node.children.include?(self)
      else
        @parent.children.delete(self)
        @parent = node
        node.children << self if node
        children
      end

  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)

    return self if self.value == target_value

    self.children.each do |node|
      search_result = node.dfs(target_value)
      return search_result if search_result
    end

    nil
  end

  def bfs(target_value)
    queue = [self]

    until queue.empty?
      node = queue.shift
      return node if node.value == target_value

      node.children.each do |child|
        queue << child
      end

    end

    nil

  end


end
