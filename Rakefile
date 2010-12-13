$:.unshift File.join( File.dirname( __FILE__ ), 'lib' )

require 'fileutils'
require 'metric_fu'


begin
  require 'version'
rescue LoadError => le
  $stderr.puts( 'You need to declare the NAME and the VERSION of your gem in lib/version.rb file' )
  exit 1
end

task :clean do
  FileUtils.remove_dir( './tmp', true )
  FileUtils.remove_dir( './pkg', true )
  FileUtils.remove_dir( './coverage', true )
end

task :build =>[:clean] do
  begin
    require 'jeweler'
  rescue LoadError => e
    fail "Jeweler not available. Install it with: gem install jeweler( #{e.message} )"
  end

  Jeweler::Tasks.new do |gemspec|

    gemspec.name              = Version::NAME
    gemspec.version           = Version::INFO
    gemspec.rubyforge_project = "http://github.com/jjuarez/#{Version::NAME}"
    gemspec.license           = 'MIT'
    gemspec.summary           = 'A very simple gem that helps to launch remote commands over SSH connections'
    gemspec.description       = 'A little remote command launcher over SSH connections'
    gemspec.email             = 'javier.juarez_AT_gmail_DOT_com'
    gemspec.homepage          = "http://github.com/jjuarez/#{Version::NAME}"
    gemspec.authors           = ['Javier Juarez']
    gemspec.files             = Dir[ 'bin/*' ] + Dir[ 'lib/**/*.rb' ] 
    
    # Dependencies
    gemspec.add_dependency( 'choice',  '>= 0.1.0' )
    gemspec.add_dependency( 'net-ssh', '>= 2.0.0' )
  end

  Jeweler::GemcutterTasks.new
end

task :test => [:clean, :build] do 
  require 'rake/runtest'
  Rake.run_tests 'test/unit/tc_*.rb'
end

task :publish => [:test] do
  begin
    require 'gemcutter'
  rescue LoadError => e
    fail "gemcutter not available"
  end
  
  gem push "./pkg/#{Version::COMPLETE}.gem"
end

task :default=>[:build]
