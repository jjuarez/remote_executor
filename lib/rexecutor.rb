begin
  %w[
      version
      options_parser
      rexecutor/yaml_loader 
      rexecutor/systems
      rexecutor/system 
      rexecutor/application
  ].each do |lib| 

  require lib 
end
rescue LoadError => e
  fail "Some lib dependencies can not be loaded: #{e.message}" 
end