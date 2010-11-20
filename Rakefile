$:.unshift File.join( File.dirname( __FILE__), 'lib' )


require 'rubygems'
require 'fileutils'
require 'remote_executor/version'


##
# Clean artifacts and build directories
task :clean do
  begin
    FileUtils.remove_dir( "./pkg" )
    FileUtils.remove_file( "#{RemoteExecutor::NAME}.gemspec" )
  rescue Exception =>e
    #... sssssshhhh
    end
end


##
# Build a gemspec and the gem
task :build =>[:clean] do
  begin
    require 'jeweler'
  rescue LoadError => e
    fail "Jeweler not available. Install it with: gem install jeweler( #{e.message} )"
  end

  Jeweler::Tasks.new do |gemspec|

    gemspec.name              = RemoteExecutor::NAME
    gemspec.version           = RemoteExecutor::VERSION
    gemspec.rubyforge_project = "http://github.com/jjuarez/#{RemoteExecutor::NAME}"
    gemspec.license           = 'MIT'
    gemspec.summary           = 'A very simple gem that helps to launch remote commands over SSH connections'
    gemspec.description       = 'A little remote command launcher over SSH connections'
    gemspec.email             = 'javier.juarez_AT_gmail_DOT_com'
    gemspec.homepage          = "http://github.com/jjuarez/#{RemoteExecutor::NAME}"
    gemspec.authors           = ['Javier Juarez']
    gemspec.files             = Dir[ 'bin/*' ] + Dir[ 'lib/**/*.rb' ] 
    
    # Dependencies
    gemspec.add_dependency( 'choice',  '>= 0.1.0' )
    gemspec.add_dependency( 'net-ssh', '>= 2.0.0' )
  end

  Jeweler::GemcutterTasks.new
end


##
# Testing the stuff...
task :test do
end


##
# Publish the gem via gemcutter
task :publish => [:test] do
  begin
    require 'gemcutter'
  rescue LoadError => e
    fail "gemcutter not available"
  end
  
  gem push "./pkg/#{RemoteExecutor::NAME}-#{RemoteExecutor::VERSION}.gem"
end


##
# DEFAULT task
task :default=>[:build]
