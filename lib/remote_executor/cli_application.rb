require 'rubygems'
require 'choice'
require 'mini_logger'
require 'net/ssh'


module RemoteExecutor
  class SshExecutionError < StandardError
  end

  ##
  # CLI Application a simple point of entry  
  class CliApplication
    
    DEFAULT_SSH_OPTIONS = { :config=>true }
        
    def self.execute_commands( server, user, commands, ssh_options=DEFAULT_SSH_OPTIONS )
      
      Net::SSH.start( server, user, ssh_options ) do |ssh| 

        commands.each do |command|
        
          MiniLogger.debug( "Executing command #{user}@#{server} '#{command}'")

          channel = ssh.open_channel do |ch|
           
            ch.exec "#{command}" do |ch, success|
             
              raise SshExecutionError.new( "could not execute: #{command}" ) unless success

              ch.on_data { |c, data| $stdout.print data }
              ch.on_extended_data { |c, type, data| MiniLogger.error( "STDERR: #{data}" ) }

              ch.on_close { MiniLogger.info( "done!" ) }
            end
          end

          channel.wait
        end      
      end
    end
    
    
    def self.run()
         
      MiniLogger.configure( :log_channel=>Choice.choices[:log], :log_level=>::Logger::DEBUG )

      systems  = Systems.new( Choice.choices[:config] )
      system   = systems.find_by_name( Choice.choices[:system] )
      user     = system.user
      commands = CommandSet.new( Choice.choices[:commands] )
      
      if( Choice.choices[:threaded] )
        
        # Launch the commands in threaded mode
        ts = []
        system.hosts.each { |s| ts << Thread.new( s ) { |t| execute_commands( s, user, commands ) } }
        ts.each { |t| t.join }
      else
        
        # Launch the commands in batch mode
        system.hosts.each { |s| execute_commands( s, user, commands ) }
      end              
    rescue StandardError =>se
      MiniLogger.error( se )
    end
  end
end