$:.unshift File.join( File.dirname( __FILE__), 'lib' )

require 'rubygems'
require 'remote_executor/version'


begin
  require 'jeweler'

  Jeweler::Tasks.new do |gemspec|

    gemspec.name        = RemoteExecutor::NAME
    gemspec.version     = RemoteExecutor::VERSION
    gemspec.summary     = 'A very simple gem that helps to launch remote commands over SSH connections'
    gemspec.description = 'A little SSH remote command launcher'
    gemspec.email       = 'javier.juarez@gmail.com'
    gemspec.homepage    = "http://github.com/jjuarez/#{RemoteExecutor::NAME}"
    gemspec.authors     = ['Javier Juarez']
    gemspec.files       = Dir[ 'lib/**/*.rb' ] + Dir[ 'bin/*' ]
  end

  Jeweler::GemcutterTasks.new
rescue LoadError => e
  $stderr.puts "Jeweler not available. Install it with: gem install jeweler( #{e.message} )"
end


task :clean do
  sh 'rm -fr ./pkg *.gemspec 2>/dev/null'
end
