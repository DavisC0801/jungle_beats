require "./test/test_helper"
require "./lib/list.rb"

class ListStructureTest < Minitest::Test
  def setup
    @list = List.new
    @node = Node.new("test")
  end

  def test_it_exists
    assert_instance_of List, @list
  end

  def test_it_has_no_head_by_default
    assert_nil @list.head
  end

  def test_it_can_append_a_node
    @list.append("test")
    assert_equal @node.data, @list.head.data
  end

  def test_the_appended_node_has_no_default_next_node
    @list.append("test")
    assert_nil @list.head.next_node
  end

  def test_it_can_count_nodes
    @list.append("test_1")
    assert_equal @list.count, 1
    @list.append("test_2")
    @list.append("test_3")
    assert_equal @list.count, 3
  end

  def test_it_can_list_nodes_as_a_string
    @list.append("doop")
    assert_equal @list.to_string, "doop"
    @list.append("deep")
    assert_equal @list.to_string, "doop deep"
  end

  def test_it_can_prepend_nodes
    @list.append("test_1")
    @list.append("test_2")
    @list.prepend("test_3")

    assert_equal @list.head.data, "test_3"
    assert_equal @list.head.next_node.data, "test_1"
    assert_equal @list.count, 3
    assert_equal @list.to_string, "test_3 test_1 test_2"
  end
end
