$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'utility_pack/core_ext/array'

class TestCoreExtensionsArray < Test::Unit::TestCase
  
  def test_random
    # functional
    assert([1].random == 1)
    assert([].random == nil)
    assert([1].random(1) == 1)
    assert([1,2,3].random(3).sort == [1,2,3])
  
    # bounds checking
    assert_raise(RuntimeError) { [1].random(0) }
    assert_raise(RuntimeError) { [1].random(-1) }
    assert_raise(RuntimeError) { [1].random(2) }
  end
  
end
