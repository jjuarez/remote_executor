$:.unshift File.join( File.dirname( __FILE__ ), %w[.. .. lib remote_executor] )

require 'test/unit'
require 'cli'


class TC_Cli < Test::Unit::TestCase
  # def setup
  # end
  # 
  # def teardown
  # end

  def test_execute
    true
  end
  
end
