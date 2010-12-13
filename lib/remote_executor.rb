#$:.unshift File.join( File.dirname( __FILE__ ), 'remote_executor' )

begin
  %w[version
     options_parser 
     remote_executor/basic_config 
     remote_executor/choice_config 
     remote_executor/application_config 
     remote_executor/system 
     remote_executor/system_config 
  ].each { |lib| require lib } 
rescue LoadError => e
  fail "Some lib dependencies can not be loaded: #{e.message}" 
end