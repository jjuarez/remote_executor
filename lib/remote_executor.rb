$:.unshift File.join( File.dirname( __FILE__ ), 'remote_executor' )

begin
  %w[version app options_parser cli config system_config system cli].each { |lib| require lib }
rescue LoadError => e
  fail "Some lib dependencies can not be loaded: #{e.message}" 
end