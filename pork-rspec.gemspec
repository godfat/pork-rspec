# -*- encoding: utf-8 -*-
# stub: pork-rspec 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "pork-rspec".freeze
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Lin Jen-Shin (godfat)".freeze]
  s.date = "2016-09-06"
  s.description = "RSpec compatibility layer for Pork.".freeze
  s.email = ["godfat (XD) godfat.org".freeze]
  s.files = [
  ".gitignore".freeze,
  ".gitmodules".freeze,
  "README.md".freeze,
  "Rakefile".freeze,
  "lib/pork-rspec.rb".freeze,
  "lib/pork-rspec/alias.rb".freeze,
  "lib/pork-rspec/api.rb".freeze,
  "lib/pork-rspec/config.rb".freeze,
  "lib/pork-rspec/context.rb".freeze,
  "lib/pork-rspec/expect.rb".freeze,
  "lib/pork-rspec/imp.rb".freeze,
  "pork-rspec.gemspec".freeze,
  "task/README.md".freeze,
  "task/gemgem.rb".freeze,
  "test/test_rspec.rb".freeze]
  s.homepage = "https://github.com/godfat/pork-rspec".freeze
  s.licenses = ["Apache License 2.0".freeze]
  s.rubygems_version = "2.6.6".freeze
  s.summary = "RSpec compatibility layer for Pork.".freeze
  s.test_files = ["test/test_rspec.rb".freeze]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<pork>.freeze, [">= 0"])
    else
      s.add_dependency(%q<pork>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<pork>.freeze, [">= 0"])
  end
end
