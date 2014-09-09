puts "running"

require "helper"

class TextQuixote < MiniTest::Spec

  def test_defaults
    q = Quixote.new
    assert_equal 100, q.max
    assert_equal 0, q.min
    assert_equal 10, q.range_by
  end

  def test_initialization
    q = Quixote.new(min: 50, max: 200, range_by: 80)
    assert_equal 50, q.min
    assert_equal 200, q.max
    assert_equal 80, q.range_by
  end

  def test_set_starting_point
    q = Quixote.new(start: 55)
    assert_equal 55, q.last
  end

  def test_random_starting_point
    100.times do
      q = Quixote.new(max: 20, min: 10)
      assert q.last >= 10, "#{q.last} is < min (10)"
      assert q.last <= 20, "#{q.last} is > max (20)"
    end

    q = Quixote.new
    q.last = 25
    assert_equal 25, q.last, 'last should be settable'
  end

  def test_range_limits
    q = Quixote.new(min: 1, max: 10, range_by: 4)
    values = []
    1000.times { values << q.next } # build up a bunch of values
    assert values.min >= 1, 'should never range below min'
    assert values.max <= 10, 'should never range above max'
  end

  def test_range_size
    q = Quixote.new(min: 1, max: 20, range_by: 6)
    last = q.last
    deltas = []
    1000.times do
      deltas << (q.next - last).abs
      last = q.last
    end
    assert_equal 6, deltas.max
    assert_equal 0, deltas.min
  end

  def test_increment_lambda
    by_two = ->(last) { last + 2 }
    q = Quixote.new(start: 0, progress: by_two)

    assert_equal 2, q.next
    assert_equal 4, q.next
  end

  def test_alternating_lambda
    alternate = lambda do |last|
      @runs ||= 0
      @runs += 1
      if (@runs % 2) == 0
        0
      else
        5
      end
    end
    q = Quixote.new(start: 0, progress: alternate)

    assert_equal 5, q.next
    assert_equal 0, q.next
    assert_equal 5, q.next
    assert_equal 0, q.next
  end

end