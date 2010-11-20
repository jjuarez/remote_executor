require 'rubygems'
require 'choice'
require 'net/ssh'


module RemoteExecutor  
  class Cli

    DEFAULT_SSH_OPTIONS = { :config=>true }
        
    def self.execute( name, environment, command, ssh_options=DEFAULT_SSH_OPTIONS )

      begin
        SystemConfig.instance( Choice.choices[:config] )
      rescue Exception => e
        #...
      end
      
      system = System.new( SystemConfig.instance.find_system( name ) )
      
      system.hosts.each do |host|
        
        Net::SSH.start( host, system.user, ssh_options ) { |ssh| ssh.exec( "#{command}" ) }
      end
    end
  end
end