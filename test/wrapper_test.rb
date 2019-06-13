require "./test/test_helper"
require "./lib/jungle_beat"
require "./lib/list"

class JungleBeatTest < Minitest::Test
  def setup
    @jb = JungleBeat.new
  end

  def test_it_exists
    assert_instance_of JungleBeat, @jb
  end

  def test_it_has_a_list
    assert_instance_of List, @jb.list
  end

  def test_list_head_is_nil_by_default
    assert_nil @jb.list.head
  end

  def test_new_items_can_be_added
    @jb.append("test_1 test_2 test_3")
    assert_equal @jb.list.head.data, "test_1"
    assert_equal @jb.list.head.next_node.data, "test_2"
    assert_equal @jb.count, 3

    @jb.append("test_4 test_5 test_6")
    assert_equal @jb.count, 6
  end
end
