require "./lib/node"

class List

  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    if @head.nil?
      @head = Node.new(data)
    else
      last.set_next(Node.new(data))
    end
  end

  def last
    final = false
    index = @head
    while !final
      return index if index.next_node.nil?
      index = index.next_node
    end
  end

  def count
    final = false
    index = @head
    count = 0
    return count if @head.nil?
    while !final
      count += 1
      return count if index.next_node.nil?
      index = index.next_node
    end
  end

  def to_string
    final = false
    index = @head
    output = ""
    return output if @head.nil?
    while !final
      output += index.data + " "
      return output if index.next_node.nil?
      index = index.next_node
    end
  end
end
