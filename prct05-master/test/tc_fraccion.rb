require 'lib/fraccion'
require 'test/unit'

class TestFraccion < Test::Unit::TestCase
   def setup
      @a = Fraccion.new(3,4)
      @b = Fraccion.new(1,2)
   end
   def tear_down
      # nothing
   end
   def test_simple
      assert_equal("3/4", @a.to_s)
      assert_equal("1/2", @b.to_s)
      assert_equal("10/8", (@a+@b).to_s)
      assert_equal("2/8", (@a-@b).to_s)
      assert_equal("3/8", (@a*@b).to_s)
      assert_equal("6/4", (@a/@b).to_s)
   end
   
   def test_failure
      assert_equal("3/4", (@a*@b).to_s)
   end
end
