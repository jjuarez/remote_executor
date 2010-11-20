module RemoteExecutor
  
  class ConfigurationError < Exception
  end
  
  class SystemConfig < Config
    include Singleton

    def find_system( system_name )
      
      @config.each { |system| return system if( system[:name] == system_name ) }
      
      raise ConfigurationError.new( "System: '#{system_name}' not found in #{@config.inspect}" )
    end
  end
end