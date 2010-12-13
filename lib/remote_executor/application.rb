require 'rubygems'
require 'net/ssh'


module Cli
  module Application

    DEFAULT_SSH_OPTIONS = { :config=>true }
        
    def self.run( name, command, ssh_options=DEFAULT_SSH_OPTIONS )

      sc = RemoteExecutor::SystemConfig.instance.find_by_name( name )
      
      if( sc )
        
        target = RemoteExecutor::System.new( sc )
        
        target.hosts.each do |host| 
        
          Net::SSH.start( host, target.user, ssh_options ) { |ssh| ssh.exec( "#{command}" ) } 
        end
      end
    end
  end
end