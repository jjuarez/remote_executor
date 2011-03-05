require 'rubygems'
require 'yaml'
require 'remote_executor/system'


module RemoteExecutor
  
  ##
  # Utility exception
  class SystemNotFound < StandardError
  end
  
  class SystemsFileError < StandardError
  end
  
  ##
  # A collection of System
  class Systems
    
    def find_by_name( name )
      
      @systems.each do |entry|
        
        return SystemFactory.create( entry ) if( name == entry[:name] ) 
      end
      
      raise SystemNotFound.new( "System: '#{name}' not found" )
    end
    
    def initialize( system_file )
    
      @systems = YAML::load_file( system_file )
    rescue Exception => e
      raise SystemsFileError.new( e.message )
    else
      self
    end
  end
  
  ##
  # A simple factory
  module SystemFactory
    extend self
    
    def create( entry )
      
      return System.new( entry )
    end
  end
end