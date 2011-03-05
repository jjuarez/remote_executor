require 'rubygems'
require 'choice'


Choice.options do
  header ''
  header '  Specific options:'

  option :config, :required=>true do
    short '-c'
    long  '--config'
    desc  'The YAML config file'
  end

  option :system, :required=>true do
    short '-s'
    long  '--system'
    desc  'The System name'
  end

  option :commands, :required=>true do
    short '-c'
    long  '--commands'
    desc  'The Command chain cmd1;cmd2;cmd3'
  end

  option :log, :required=>false do
    short '-l'
    long  '--log'
    desc  'The log file'
    default '/tmp/remote_executor.log'
  end
  
  option :threaded, :required=>false do
    short '-t'
    long  '--threaded'
    desc  'value: true | false, executes the commands over a server in paralel or not'
    default 'true'
  end

  separator ''
  separator '  Common options:'

  option :help do
    short '-h'
    long '--help'
    desc "Show this screen"
  end

  separator ''
end