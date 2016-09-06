
begin
  require "#{dir = File.dirname(__FILE__)}/task/gemgem"
rescue LoadError
  sh 'git submodule update --init --recursive'
  exec Gem.ruby, '-S', $PROGRAM_NAME, *ARGV
end

%w[lib pork/lib].each do |path|
  $LOAD_PATH.unshift(File.expand_path("#{dir}/#{path}"))
end

Gemgem.init(dir) do |s|
  s.name    = 'pork-rspec'
  s.version = '0.0.1'

  %w[pork].each{ |g| s.add_runtime_dependency(g) }

  # exclude pork
  s.files.reject!{ |f| f.start_with?('pork/') }
end
