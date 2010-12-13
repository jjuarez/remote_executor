require 'rubygems'
require 'net/ssh'


module Cli
  ##
  # Some entry point for the CLI Application
  class Application
    
    def self.command( host, user, command )
      
      Net::SSH.start( host, user, { :config=>true } ) { |ssh| ssh.exec( "#{command}" ) }
    end
    
    def self.system( system, command )
      
      system.hosts.each { |host| Application.command( host, system.user, command ) }
    end

    def self.run( systems, name, command )

      target = RemoteExecutor::Systems.new( systems ).find_by_name( name )

      Application.system( target, command ) if target 
    end
  end
end