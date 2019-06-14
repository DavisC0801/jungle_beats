require "./test/test_helper"
require "./lib/list"

class ListStructureTest < Minitest::Test
  def setup
    @list = List.new
    @node = Node.new("deep")
  end

  def test_it_exists
    assert_instance_of List, @list
  end

  def test_it_has_no_head_by_default
    assert_nil @list.head
  end

  def test_it_can_append_a_node
    @list.append("deep")
    assert_equal @node.data, @list.head.data
  end

  def test_the_appended_node_has_no_default_next_node
    @list.append("deep")
    assert_nil @list.head.next_node
  end

  def test_it_can_count_nodes
    @list.append("deep")
    assert_equal @list.count, 1
    @list.append("dah")
    @list.append("doo")
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
    @list.append("deep")
    @list.append("dah")
    @list.prepend("doo")

    assert_equal @list.head.data, "doo"
    assert_equal @list.head.next_node.data, "deep"
    assert_equal @list.count, 3
    assert_equal @list.to_string, "doo deep dah"
  end

  def test_it_can_insert_nodes
    @list.append("deep")
    @list.append("doo")
    @list.append("dah")
    @list.insert(1, "shu")

    assert_equal @list.to_string, "deep shu doo dah"
  end

  def test_it_can_find_nodes
    @list.prepend("deep")
    @list.append("doop")
    @list.append("dah")
    @list.append("shu")

    assert_equal @list.find(2, 1), "dah"
    assert_equal @list.find(1, 3), "doop dah shu"

    assert_equal @list.find(0, 50), "deep doop dah shu"
    assert_equal @list.find(50, 50), "shu"
  end

  def test_it_can_check_if_data_is_included_in_list
    @list.prepend("deep")
    @list.append("doo")
    @list.append("dah")
    @list.append("shu")

    assert @list.includes?("deep")
    assert @list.includes?("dah")
    assert @list.includes?("shu")
    refute @list.includes?("test_99")
    refute @list.includes?("facepalm")
  end

  def test_it_can_pop_from_the_list
    assert_nil @list.pop

    @list.prepend("deep")
    assert_equal @list.pop, "deep"
    assert_nil @list.pop
    assert_equal @list.to_string, ""


    @list.prepend("deep")
    @list.append("doo")
    @list.append("dah")
    @list.append("shu")
    @list.append("woo")

    assert_equal @list.to_string, "deep doo dah shu woo"
    assert_equal @list.pop, "woo"
    assert_equal @list.pop, "shu"
    assert_equal @list.to_string, "deep doo dah"
  end
end
