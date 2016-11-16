
begin
  require "#{__dir__}/task/gemgem"
rescue LoadError
  sh 'git submodule update --init --recursive'
  exec Gem.ruby, '-S', $PROGRAM_NAME, *ARGV
end

Gemgem.init(__dir__, :submodules => %w[pork]) do |s|
  s.name    = 'pork-rspec'
  s.version = '0.5.0'

  %w[pork muack].each(&s.method(:add_runtime_dependency))
end
