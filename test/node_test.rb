require "./test/test_helper"
require "./lib/node"

class NodeTest < Minitest::Test
  def setup
    @node = Node.new("test")
  end

  def test_it_exists
    assert_instance_of Node, @node
  end

  def test_it_holds_data
    assert_equal @node.data, "test"
  end

  def test_it_has_no_next_node_by_default
    assert_nil @node.next_node
  end

  def test_it_can_change_next_node
    node_2 = Node.new("test_2")
    @node.set_next(node_2)
    assert_equal node_2, @node.next_node
  end
end
