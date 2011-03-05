require 'rubygems'
require 'choice'


Choice.options do
  header ''
  header '  Specific options:'

  option :config, :required=>true do
    short '-c'
    long  '--config=settings.yml'
    desc  'The YAML config file'
  end

  option :system, :required=>true do
    short '-s'
    long  '--system=value'
    desc  'The System name'
  end

  option :command, :required=>true do
    short '-c'
    long  '--command=value'
    desc  'The Command'
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