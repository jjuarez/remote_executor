module RemoteExecutor
  
  class BadEnvironment < Exception
  end
  
  class Cli

    DEFAULT_SSH_OPTIONS = { :config=>true }
        
    def self.execute( name, environment, command, ssh_options=DEFAULT_SSH_OPTIONS )

      system = System.new( SystemConfig.instance.find_system( name ) )
      
      if( system.environment == environment )
        
        system.hosts.each do |host|
        
          Net::SSH.start( host, system.user, ssh_options ) { |ssh| ssh.exec( "#{command}" ) }
        end
      else
        raise BadEnvironment.new( "Bad environment: '#{system.environment}' for target: '#{system.name}'..." )
      end
    end
  end
end