module RemoteExecutor  
  class System < Struct.new( :name, :user, :hosts )

    def self.validate( parameters )
      parameters[:name]  && parameters[:name]  != '' && 
      parameters[:user]  && parameters[:user]  != '' && 
      parameters[:hosts] && parameters[:hosts] != []
    end
        
    def initialize( parameters )
      super( parameters[:name], parameters[:user], parameters[:hosts] )
    end
  end
end