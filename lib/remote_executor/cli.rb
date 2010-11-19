module RemoteExecutor
  class Cli
    
    def self.execute( environment, name, command )

      Config.instance[environment].each do |system| 

        if( system[:name] == name )          
          system[:hosts].each { |host| Net::SSH.start( host, 'root', :config=>true ) { |ssh| ssh.exec "#{command}" } }
        end 
      end
    end
  end
end