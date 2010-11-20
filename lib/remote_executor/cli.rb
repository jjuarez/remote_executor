module RemoteExecutor
  
  class BadEnvironment < Exception
  end
  
  class Cli
    
    def self.execute( name, environment, command )

      system_target = SystemConfig.instance.find_system( name )
      
      if( system_target[:environment].to_sym == environment.to_sym )
        
        system_target[:hosts].each do |host|
        
          Net::SSH.start( host, system_target[:user], :config=>true ) { |ssh_session| ssh_session.exec( "#{command}" ) }
        end
      else
        raise BadEnvironment.new( "Bad environment..." )
      end
    end
  end
end