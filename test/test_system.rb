$:.unshift( File.join( File.dirname( __FILE__ ), %w[.. lib] ) )

#require 'test/unit'
require 'rubygems'
require 'shoulda'
require 'remote_executor/system'


class SystemTest < Test::Unit::TestCase
  
  context "System" do

    TEST_SYSTEM_NAME  = 'server.environment'
    TEST_SYSTEM_USER  = 'user'
    TEST_SYSTEM_HOSTS = [ 
      'server1.system.environment', 
      'server2.system.environment', 
      'server3.system.environment', 
      'server4.system.environment' 
    ]
    TEST_PARAMS = { 
      :name  =>TEST_SYSTEM_NAME, 
      :user  =>TEST_SYSTEM_USER, 
      :hosts =>TEST_SYSTEM_HOSTS
    }
  
    setup do
      @test_system = RemoteExecutor::System.new( TEST_PARAMS )
    end 
  
    should "raise ArgumentError for a no hash parameter" do
      
      assert_raises( ArgumentError ) { RemoteExecutor::System.new( 1 )  }
      assert_raises( ArgumentError ) { RemoteExecutor::System.new( :foo )  }
      assert_raises( ArgumentError ) { RemoteExecutor::System.new( "foo" )  }
      assert_raises( ArgumentError ) { RemoteExecutor::System.new( [1,2,3] )  }
    end
    
    should "raise ArgumentError for empty hash" do
      assert_raise( ArgumentError ) { RemoteExecutor::System.new( { } ) }
    end
        
    should "raise ArgumentError for empty name" do
      assert_raises( ArgumentError ) { RemoteExecutor::System.new( { :user=>TEST_SYSTEM_USER, :hosts=>TEST_SYSTEM_HOSTS } ) }
    end

    should "raise ArgumentError for empty user and hosts" do
      assert_raises( ArgumentError ) { RemoteExecutor::System.new( { :name=>TEST_SYSTEM_NAME } ) }
    end

    should "raise ArgumentError for empty hosts" do
      assert_raises( ArgumentError ) { RemoteExecutor::System.new( { :name=>TEST_SYSTEM_NAME, :user=>TEST_SYSTEM_USER } ) }
    end
      
    should "create a System object" do
      assert_instance_of( RemoteExecutor::System, @test_system )
    end
    
    should "create a valid System object" do
      assert( @test_system.name && @test_system.user && @test_system.hosts )
    end
    
    should "the name equal" do  
      assert_equal( TEST_SYSTEM_NAME,  @test_system.name )
    end
    
    should "the user equal" do
      assert_equal( TEST_SYSTEM_USER,  @test_system.user )
    end
    
    should "the hosts equal" do
      assert_equal( TEST_SYSTEM_HOSTS, @test_system.hosts )
    end
  end
end