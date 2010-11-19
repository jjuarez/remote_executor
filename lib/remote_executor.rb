begin
  %w[rubygems yaml singleton choice net/ssh].each { |gem| require gem }
  %w[options_parser config cli].each { |lib| require "remote_executor/#{lib}"}
rescue LoadException => e
  $stderr.puts e.message
end