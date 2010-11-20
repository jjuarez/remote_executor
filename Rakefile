$:.unshift File.join( File.dirname( __FILE__), 'lib' )

require 'rubygems'
require 'fileutils'
require 'remote_executor/version'


begin
  require 'jeweler'
rescue LoadError => e
  fail "Jeweler not available. Install it with: gem install jeweler( #{e.message} )"
end

##
# build a gemspec and the gem
task :build do
  Jeweler::Tasks.new do |gemspec|

    gemspec.name              = RemoteExecutor::NAME
    gemspec.version           = RemoteExecutor::VERSION
    gemspec.rubyforge_project = "http://github.com/jjuarez/#{RemoteExecutor::NAME}"
    gemspec.license           = 'MIT'
    gemspec.summary           = 'A very simple gem that helps to launch remote commands over SSH connections'
    gemspec.description       = 'A little remote command launcher over SSH connections'
    gemspec.email             = 'javier.juarez_AT_ gmail_DOT_com'
    gemspec.homepage          = "http://github.com/jjuarez/#{RemoteExecutor::NAME}"
    gemspec.authors           = ['Javier Juarez']
    gemspec.files             = Dir[ 'lib/**/*.rb' ] + Dir[ 'bin/*' ]
    
    # Dependencies
    gemspec.add_dependency( 'choice' )
    gemspec.add_dependency( 'net-ssh' )
  end

  Jeweler::GemcutterTasks.new
end

##
# clean artifacts and build directories
task :clean do
  begin
    FileUtils.remove_dir( "./pkg" )
    FileUtils.remove_file( "#{RemoteExecutor::NAME}.gemspec" )
  rescue Exception =>e
    #... sssssshhhh
    end
end

task :default => [:clean, :build] do
end
