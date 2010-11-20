require 'singleton'
require 'config'


module RemoteExecutor
  
  class SystemConfig < Config
    include Singleton

    def find_system( system_name )
      
      @config.each do |system|
         
        return system if( system[:name] == system_name )
      end
      
      raise ConfigurationError.new( "System: '#{system_name}' not found" )
    end
  end
end