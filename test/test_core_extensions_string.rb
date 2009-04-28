$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'utility_pack/core_ext/string'

class TestCoreExtensionsString < Test::Unit::TestCase
  
  def test_fill
    assert_equal "hello world", "hello :name".fill(:name => 'world')
    assert_equal "1 2 3 3 2 1", ":one 2 3 3 2 :one".fill(:one => '1')
  end
  
end
