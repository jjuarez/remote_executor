begin
  %w[rubygems yaml singleton choice net/ssh].each { |gem| require gem }
rescue LoadError => e
  fail "Some gem dependencies can´t be loaded: #{e.message}" 
end

$:.unshift File.join( File.dirname( __FILE__), 'remote_executor' )

begin
  %w[version config options_parser cli].each { |lib| require lib }
rescue LoadError => e
  fail "Some lib dependencies can´t be loaded: #{e.message}" 
end