require 'singleton'
require 'choice_config'


module RemoteExecutor
  class SystemConfig < ChoiceConfig
    include Singleton
    
    def find_by_name( name )
      
      @config.each { |system| return system if( system[:name] == name ) }
      raise Exception.new( "System: '#{name}' not found" )
    end
  end
end