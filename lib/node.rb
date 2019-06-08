class Node

  attr_reader :next_node, :data

  def initialize(data)
    @data = data
    @next_node = nil
  end

  def set_next(node)
    @next_node = node
  end
end
