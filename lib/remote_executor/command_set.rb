module RemoteExecutor
  ##
  # Command representation
  class CommandSet
    include Enumerable
    
    DEFAULT_COMMAND_SEPARATOR = ";"
    
    attr_reader :commands
    
    def self.parse( commands_str, separator=DEFAULT_COMMAND_SEPARATOR )
      
      commands = Array.new
      commands_str.split( separator ).each { |command| commands << command.strip }
      commands
    end


    def initialize( commands_str )

      @commands = CommandSet.parse( commands_str ) if( commands_str )      
      self
    end
    
        
    def each( &block )
      
      @commands.each { |command| block.call( command ) } if block_given?
    end
    
    
    def length
      @commands.length
    end
  end
end