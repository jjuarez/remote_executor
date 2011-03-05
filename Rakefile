$:.unshift( File.join( File.dirname( __FILE__ ), %w[lib remote_executor] ) )

require 'fileutils'
require 'metric_fu'


begin
  require 'version'
rescue LoadError => le
  $stderr.puts( le.message )
  exit 1
end


desc "Clean all temporary stuff"
task :clean do
  
  [ './tmp', './pkg', './coverage' ].each do |directory|
    
    FileUtils.remove_dir( directory, true )
  end
end


desc "Build the gem"
task :build =>[:clean] do
  begin
    require 'jeweler'
  rescue LoadError => e
    fail "Jeweler not available. Install it with: gem install jeweler( #{e.message} )"
  end

  Jeweler::Tasks.new do |gemspec|

    gemspec.name              = RemoteExecutor::Version::NAME
    gemspec.version           = RemoteExecutor::Version::NUMBER
    gemspec.rubyforge_project = "http://github.com/jjuarez/#{RemoteExecutor::Version::NAME}"
    gemspec.license           = 'MIT'
    gemspec.summary           = 'A very simple gem that helps to launch remote commands over SSH connections'
    gemspec.description       = 'A little remote command launcher over SSH connections'
    gemspec.email             = 'javier.juarez@gmail.com'
    gemspec.homepage          = "http://github.com/jjuarez/#{RemoteExecutor::Version::NAME}"
    gemspec.authors           = ['Javier Juarez']
    gemspec.files             = Dir[ 'bin/*' ] + Dir[ 'lib/**/*.rb' ] 
    
    gemspec.add_dependency( 'choice' )
    gemspec.add_dependency( 'net-ssh', '>= 2.0.0' )
  end

  Jeweler::GemcutterTasks.new
end


desc "Testing..."
task :test do 
  require 'rake/runtest'
  Rake.run_tests 'test/test_*.rb'
end


task :default=>[:build]