require "./lib/node"

class List

  attr_reader :head

  def initialize
    @head = nil
    @acceptable_inputs = ["doop", "ding", "dah", "oom", "tee", "dee", "bop", "boop", "la", "na", "hoo", "doo", "ditt", "deep", "woo", "shi", "shu", "blop", "dop", "plop", "suu"]
    @list_length = 0
  end

  def append(data)
    if @acceptable_inputs.include?(data)
      if @head.nil?
        @head = Node.new(data)
      else
        find_by_index(@list_length - 1).set_next(Node.new(data))
      end
      @list_length += 1
    end
  end

  def prepend(data)
    if @acceptable_inputs.include?(data)
      if @head.nil?
        @head = Node.new(data)
      else
        old_head = @head
        @head = Node.new(data)
        @head.set_next(old_head)
      end
      @list_length += 1
    end
  end

  def insert(index, data)
    if @acceptable_inputs.include?(data)
      node = find_by_index(index - 2)
      old_next = node.next_node
      node.set_next(Node.new(data))
      node.next_node.set_next(old_next)
      @list_length += 1
    end
  end

  def count
    return 0 if @head.nil?
    index = @head
    count = 1
    while !index.next_node.nil?
      count += 1
      index = index.next_node
    end
    count
  end

  def to_string
    index = @head
    output = ""
    return output if @head.nil?
    loop do
      output += index.data
      return output if index.next_node.nil?
      output += " "
      index = index.next_node
    end
  end

  def find_by_index(index)
    node = @head
    index.times do
      node = node.next_node if !node.next_node.nil?
    end
    node
  end

  def find(index, limit)
    node = find_by_index(index - 1)
    node = node.next_node if index > 0 && !node.next_node.nil?
    output = ""
    count = 0
    while limit >= count
      output += node.data
      count += 1
      return output if node.next_node.nil? || limit == count
      output += " "
      node = node.next_node
    end
  end

  def includes?(search_value)
    index = @head
    while !index.nil?
      return true if index.data == search_value
      index = index.next_node
    end
    false
  end

  def pop
    return nil if @head.nil?
    tail = find_by_index(count - 2)
    final_node = tail.next_node
    if final_node.nil?
      final_node = tail
      @head = nil
    end
    tail.set_next(nil)
    return nil if final_node.nil?
    final_node.data
  end
end
