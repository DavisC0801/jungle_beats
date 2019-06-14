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

  def skip_test_it_can_play_beats
    @jb.append("ding dah oom oom ding oom oom oom ding dah oom oom ding dah oom oom ding dah oom oom")
    @jb.play
  end

  def test_it_can_validate_beats
    test_jb = JungleBeat.new("deep")
    test_jb.append("test_1")
    assert_equal test_jb.list.count, 1
    test_jb.append("ding dah test_2 oom")
    assert_equal test_jb.list.count, 4
  end

  def test_it_can_change_rate
    assert_equal @jb.rate, 500
    @jb.rate = 100
    assert_equal @jb.rate, 100
    @jb.reset_rate
    assert_equal @jb.rate, 500
  end

  def test_it_can_change_voice
    assert_equal @jb.voice, "Alex"
    @jb.voice = "Alice"
    assert_equal @jb.voice, "Alice"
    @jb.reset_voice
    assert_equal @jb.voice, "Alex"
  end
end
