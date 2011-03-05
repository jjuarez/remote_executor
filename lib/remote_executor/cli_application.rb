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
    
    
    def self.process_system_threaded( system, commands )
      
      threads = []
    
      system.hosts.each do |server|
        
        threads << Thread.new( server ) { |t| execute_commands( server, system.user, commands ) }
      end
    
      threads.each { |t| t.join }
    end
    
    
    def self.process_system_batch( system, commands )
      
      system.hosts.each do |server|
        execute_commands( server, system.user, commands )
      end
    end


    def self.run( systems_config, log, threaded, name, commands )
      
      MiniLogger.configure( :log_channel=>log, :log_level=>::Logger::DEBUG )
      
      if( threaded )
        process_system_threaded( Systems.new( systems_config ).find_by_name( name ), commands )
      else
        process_system_batch( Systems.new( systems_config ).find_by_name( name ), commands )
      end              
    rescue StandardError =>se
      MiniLogger.error( se.message )
    end
  end
end