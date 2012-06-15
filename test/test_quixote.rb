puts "running"

require "helper"

class TextQuixote < MiniTest::Spec

  def test_defaults
    q = Quixote.new
    assert_equal 100, q.max
    assert_equal 0, q.min
    assert_equal 10, q.range_by
  end

end