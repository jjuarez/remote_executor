require 'rubygems'
require 'net/ssh'


module RemoteExecutor
  ##
  # CLI Application a simple point of entry  
  class CLIApplication
    
    def self.command( host, user, command )
      
      Net::SSH.start( host, user, { :config=>true } ) { |ssh| ssh.exec( "#{command}" ) }
    end
    
    def self.system( system, command )
      
      system.hosts.each { |host| CLIApplication.command( host, system.user, command ) }
    end

    def self.run( systems, name, command )

      target = RemoteExecutor::Systems.new( systems ).find_by_name( name )

      CLIApplication.system( target, command ) if target 
    end
  end
end