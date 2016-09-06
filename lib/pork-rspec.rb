
require 'pork'
require 'pork-rspec/api'
require 'pork-rspec/imp'
require 'pork-rspec/context'
require 'pork-rspec/config'

include RSpec::API
Pork::Executor.extend RSpec::Imp
Pork::Executor.include RSpec::Context

module RSpec
  def self.configure
    yield(config)
  end

  def self.config
    @config ||= Config.new
  end
end
