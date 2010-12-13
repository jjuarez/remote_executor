require 'rubygems'
require 'net/ssh'


module Cli
  ##
  # Some entry point for the CLI Application
  class Application
    
    def self.execute_command( system, command )
      
      system.hosts.each do |host|
        
        Net::SSH.start( host, system.user, { :config=>true } ) do |ssh|           
        
          ssh.exec( "#{command}" )
        end
      end
    end

    def self.run( systems, name, command )

      target_system = RemoteExecutor::Systems.new( systems ).find_by_name( name )

      execute_command( target_system, command ) if target_system 
    end
  end
end