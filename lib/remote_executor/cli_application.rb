require 'rubygems'
require 'mini_logger'
require 'net/ssh'


module RemoteExecutor
  ##
  # CLI Application a simple point of entry  
  class CliApplication
        
    COMMAND_SEPARATOR = ";"
        
        
    def self.execute_commands( server, user, commands, ssh_options={ :config=>true } )
      
      Net::SSH.start( server, user, ssh_options ) do |ssh| 

        commands.split( COMMAND_SEPARATOR ).each do |command|
        
          MiniLogger.debug( "Executing command #{user}@#{server} '#{command}'")
          ssh.exec( "#{command}" ) 
        end
      end
    end
    
    
    def self.process_system( system, commands, threaded )
      
      if( threaded )
        
        threads = []
      
        system.hosts.each do |server|
          
          threads << Thread.new( server ) { |t| execute_commands( server, system.user, commands ) }
        end
      
        threads.each { |t| t.join }
      else
        
        system.hosts.each do |server|
          execute_commands( server, system.user, commands )
        end
      end
    end


    def self.run( systems_config, log, threaded, name, commands )
      
      MiniLogger.configure( :log_channel=>log, :log_level=>::Logger::DEBUG )
      process_system( Systems.new( systems_config ).find_by_name( name ), commands, threaded )      
    rescue SystemsFileError =>sfe
      MiniLogger.error( sfe.message )
    rescue SystemNotFound =>snf
      MiniLogger.error( snf.message )
    end
  end
end