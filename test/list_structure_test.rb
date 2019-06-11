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
    assert_equal @list.to_string, ""
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

  def test_it_can_insert_nodes
    @list.append("test_1")
    @list.append("test_2")
    @list.append("test_3")
    @list.insert(1, "test_4")

    assert_equal @list.to_string, "test_1 test_4 test_2 test_3"
  end

  def test_it_can_find_nodes
    @list.prepend("test_1")
    @list.append("test_2")
    @list.append("test_3")
    @list.append("test_4")

    assert_equal @list.find(2, 1), "test_3"
    assert_equal @list.find(1, 3), "test_2 test_3 test_4"

    assert_equal @list.find(0, 50), "test_1 test_2 test_3 test_4"
    assert_equal @list.find(50, 50), "test_4"
  end

  def test_it_can_check_if_data_is_included_in_list
    @list.prepend("test_1")
    @list.append("test_2")
    @list.append("test_3")
    @list.append("test_4")

    assert @list.includes?("test_1")
    assert @list.includes?("test_3")
    assert @list.includes?("test_4")
    refute @list.includes?("test_99")
    refute @list.includes?("facepalm")
  end

  def test_it_can_pop_from_the_list
    assert_nil @list.pop

    @list.prepend("test_1")
    assert_equal @list.pop, "test_1"
    assert_nil @list.pop
    assert_equal @list.to_string, ""


    @list.prepend("test_1")
    @list.append("test_2")
    @list.append("test_3")
    @list.append("test_4")
    @list.append("test_5")

    assert_equal @list.to_string, "test_1 test_2 test_3 test_4 test_5"
    assert_equal @list.pop, "test_5"
    assert_equal @list.pop, "test_4"
    assert_equal @list.to_string, "test_1 test_2 test_3"
  end
end
