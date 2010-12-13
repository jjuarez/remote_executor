module RemoteExecutor  
  ##
  # System represents a set of hosts that implement a service
  class System
    
    attr_reader :name, :user, :hosts
        
    def self.validate( parameters )
      parameters[:name] && parameters[:user] && parameters[:hosts]
    end
        
    def initialize( parameters )
      
      if System.validate( parameters )
        
        @name  = parameters[:name]
        @user  = parameters[:user]
        @hosts = parameters[:hosts]
        
        self
      end
    end
  end
end